require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
  gem 'nokogiri'
end

class PresetBuilder
  DEFAULT_CLOCK_LENGTH = 8

  DEFAULT_SEND_MICROPHONE = true
  DEFAULT_SEND_KEYBOARD   = false
  DEFAULT_SEND_GUITAR     = true

  def initialize(file)
    @file = file
    @step = 1
    @result = []
    @title = nil

    @clockLength = DEFAULT_CLOCK_LENGTH

    @sendMicrophone = DEFAULT_SEND_MICROPHONE
    @sendKeyboard   = DEFAULT_SEND_KEYBOARD
    @sendGuitar     = DEFAULT_SEND_GUITAR

    @nextMicrophonePreset = nil
    @nextKeyboardPreset   = nil
    @nextGuitarPreset     = nil

    process
  end

  def title
    @title
  end

  def code
    @result.map {|line| line = "    #{line}"}.join("\n")
  end

  def tmp_file
    "#{@file}.html"
  end

  def process
    convert_md_to_html
    generate_mozaic_script
    tear_down
  end

  def tear_down
    puts `unlink #{tmp_file}`
  end

  def convert_md_to_html
    puts `pandoc -s -o #{tmp_file} #{@file} --metadata title="No title"`
  end

  def generate_mozaic_script
    @doc = File.open(tmp_file) { |f| Nokogiri::Slop(f) }

    @title = @doc.html.body.h1.text

    @doc.html.body.h2.each_with_index do |h2, i|
      @result << "// #{h2.text}"

      li = @doc.html.body.ul[i].li
      li = [li] if li.count == 0 # See https://stackoverflow.com/questions/65576289/

      li.each do |li|
        # next if li.is_a?(Array) # See https://stackoverflow.com/questions/65576168/

        part = li.children.reject(&:element?).first.text.strip # Text of first <li> element
        settings = li.ul.li.select(&:element?).map(&:text)        # All texts of contained <li> elements (2nd level list items)

        generate_prepare  part, settings
        generate_activate unless @step == 2 # The very first song part will be activated immediately
      end

      @result << ""
    end

    @result << '  Call @Error'
    @result << "endif"
  end

  def generate_prepare(part, settings)
    @result << "#{:else if @step > 1}if step = #{@step} // #{part}"

    settings.each_with_index do |setting, i|
      if codes = convert_setting_to_code(setting)
        codes.each do |code|
          @result << '  Call @' + code
        end

        @result << nil if codes.size > 1 && i != codes.size # Add a line break
      end
    end

    @step += 1
  end

  def convert_setting_to_code(setting)
    codes = []

    case setting
    when /🎤\s?❌/
      if @sendMicrophone
        @sendMicrophone = false
        codes << 'ToggleSendMicrophone // 🎤 ❌' # TODO: Should not happen immediately!
      end
    when /🎤\s?✔️/
      if !@sendMicrophone
        @sendMicrophone = true
        @nextMicrophonePreset = 1
      end
    when /🎸\s?([1-3])\s?(✔️)?/
      codes << "PrepareGuitarPreset#{$1} // 🎸 #{$1}"
      @nextGuitarPreset = $1

      if $2 == '✔️'
        @sendGuitar = true
        codes << 'ToggleSendGuitar // 🎸 ✔️'
        @nextGuitarPreset = nil
      end
    when /🎹\s?([1-3])\s?(✔️)?/
      codes << "PrepareKeyboardPreset#{$1} // 🎹 #{$1}"
      @nextKeyboardPreset = $1

      if $2 == '✔️'
        @sendKeyboard = true
        codes << 'ToggleSendKeyboard // 🎹 ✔️'
        @nextKeyboardPreset = nil
      end
    when /⏲️\s?(\d+)/
      while @clockLength != $1.to_i
        if @clockLength < $1.to_i
          @clockLength += 1
          codes << "IncreaseClockLength // ⏲️ #{@clockLength}"
        else
          @clockLength -= 1
          codes << "DecreaseClockLength // ⏲️ #{@clockLength}"
        end
      end
    when /⏺️\s?([0-4])/
      codes << "RecordNextLoopInGroup#{$1} // ⏺️ #{$1}"
    when /▶️\s?([1-4])/
      codes << "ToggleAndSelectGroup#{$1} // ▶️ #{$1}"
    else
      puts "Unknown setting #{setting}, assuming it's just text."
    end

    codes
  end

  def generate_activate
    @result << "#{:else if @step > 1}if step = #{@step}"

    if @nextMicrophonePreset
      @result << '  Call @ToggleSendMicrophone // 🎤 ✔️'
      @nextMicrophonePreset = nil
    end

    if @nextKeyboardPreset
      @result << '  Call @ToggleSendKeyboard // 🎹 ✔️'
      @nextKeyboardPreset = nil
    end

    if @nextGuitarPreset
      @result << '  Call @ToggleSendGuitar // 🎸 ✔️'
      @nextGuitarPreset = nil
    end

    @step += 1
  end
end

class PresetsBuilder
  def initialize
    @presets = []

    process
    print_script_to_file
  end

  def process
    Dir["songs/*.md"].each do |file|
      @presets << PresetBuilder.new(file)
    end
  end

  def print_script_to_file
    result = []
    template = File.open("_template").read

    template.gsub! "{{PRESETS_SIZE}}", @presets.size.to_s

    @presets.each_with_index do |preset, i|
      result << "  //////////////////"
      result << "  // #{preset.title}"
      result << "  //////////////////"
      result << "  #{:else if i > 0}if preset = #{i + 1}"
      result << preset.code
      result << ""
    end
    result << "  endif"

    template.gsub! "{{CODE}}", result.join("\n")

    file = File.new("../src/1b-preset-mode", "w")
    file.puts(template)
    file.close
  end
end

PresetsBuilder.new