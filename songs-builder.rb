require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
  gem 'nokogiri'
end

class SongsBuilder
  HTML_FILE = "song.html"

  DEFAULT_CLOCK_LENGTH = 8

  DEFAULT_SEND_MICROPHONE = true
  DEFAULT_SEND_KEYBOARD   = false
  DEFAULT_SEND_GUITAR     = true

  def initialize
    @step = 1
    @result = []

    @clockLength = DEFAULT_CLOCK_LENGTH

    @sendMicrophone = DEFAULT_SEND_MICROPHONE
    @sendKeyboard   = DEFAULT_SEND_KEYBOARD
    @sendGuitar     = DEFAULT_SEND_GUITAR

    @nextGuitarPreset   = nil
    @nextKeyboardPreset = nil
  end

  def process
    convert_md_to_html
    generate_mozaic_script
    print_script_to_file
    tear_down
  end

  def tear_down
    puts `unlink #{HTML_FILE}`
  end

  def convert_md_to_html
    puts `pandoc -s -o #{HTML_FILE} songs/wish-you-were-here.md --metadata title="No title"`
  end

  def generate_mozaic_script
    @doc = File.open(HTML_FILE) { |f| Nokogiri::Slop(f) }

    @doc.html.body.h2.each_with_index do |h2, i|
      @result << "// #{h2.text}"

      table = @doc.html.body.table[i + 1] # See https://stackoverflow.com/questions/65576289/
      table.tbody.tr.each do |tr|
        next if tr.is_a?(Array) # See https://stackoverflow.com/questions/65576168/

        generate_prepare  tr.td[0].text, extract_settings(tr.td[1])
        generate_activate unless @step == 2 # The very first song part will be activated immediately
      end

      @result << ""
    end

    @result << "endif"
  end

  def extract_settings(td)
    td.children.reject {|child| child.name == 'br' } # Remove <br> nodes
               .map(&:text)                          # Use text of nodes
               .map { |text| text.gsub(/\s/, '')}    # Remove white space from text
  end

  def generate_prepare(part, settings)
    @result << "#{:else if @step > 1}if @step = #{@step} // #{part}"

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
    when /🎤❌/
      if @sendMicrophone
        @sendMicrophone = false
        codes << 'ToggleSendMicrophone // 🎤❌'
      end
    when /🎸([1-3])(✔️)?/
      codes << "PrepareGuitarPreset#{$1} // 🎸#{$1}"
      @nextGuitarPreset = $1

      if $2 == '✔️'
        @sendGuitar = true
        codes << 'ToggleSendGuitar // 🎸✔️'
        @nextGuitarPreset = nil
      end
    when /🎹([1-3])(✔️)?/
      codes << "PrepareKeyboardPreset#{$1} // 🎹#{$1}"
      @nextKeyboardPreset = $1

      if $2 == '✔️'
        @sendKeyboard = true
        codes << 'ToggleSendKeyboard // 🎹✔️'
        @nextKeyboardPreset = nil
      end
    when /⏲️(\d+)/
      while @clockLength != $1.to_i
        if @clockLength < $1.to_i
          @clockLength += 1
          codes << "IncreaseClockLength // ⏲️#{@clockLength}"
        else
          @clockLength -= 1
          codes << "DecreaseClockLength // ⏲️#{@clockLength}"
        end
      end
    when /⏺️([0-4])/
      codes << "RecordNextLoopInGroup#{$1} // ⏺️#{$1}"
    else
      print_script_to_file
      tear_down
      raise "Unknown setting #{setting}!"
    end

    codes
  end

  def generate_activate
    @result << "#{:else if @step > 1}if @step = #{@step}"

    if @nextKeyboardPreset
      @result << '  Call @ToggleSendKeyboard // 🎹✔️'
      @nextKeyboardPreset = nil
    end

    if @nextGuitarPreset
      @result << '  Call @ToggleSendGuitar // 🎸✔️'
      @nextGuitarPreset = nil
    end

    @step += 1
  end

  def print_script_to_file
    puts @result.join("\n")
    file = File.new("songs/wish-you-were-here.mozaic", "w")
    file.puts(@result.join("\n"))
    file.close
  end
end

SongsBuilder.new.process
