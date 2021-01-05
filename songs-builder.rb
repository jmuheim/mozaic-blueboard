require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
  gem 'nokogiri'
end

class SongsBuilder
  HTML_FILE = "song.html"

  def initialize
    @step = 1
    @result = []

    @sendMicrophone = true
    @sendKeyboard   = false
    @sendGuitar     = true
  end

  def process!
    convert_md_to_html!
    generate_mozaic_script!
    tear_down!
  end

  def tear_down!
    puts `unlink #{HTML_FILE}`
  end

  def convert_md_to_html!
    puts `pandoc -s -o #{HTML_FILE} songs/wish-you-were-here.md --metadata title="No title"`
    @doc = File.open(HTML_FILE) { |f| Nokogiri::Slop(f) }
  end

  def generate_mozaic_script!
    @doc.html.body.h2.each_with_index do |h2, i|
      @result << "// #{h2.text}"

      table = @doc.html.body.table[i + 1] # See https://stackoverflow.com/questions/65576289/
      table.tbody.tr.each do |tr|
        next if tr.is_a?(Array) # See https://stackoverflow.com/questions/65576168/

        part     = tr.td[0].text
        prepare  = tr.td[1].text
        activate = tr.td[2].text

        @result << "#{:else if @step > 1}if @step = #{@step} // #{part}"

        @step += 1
      end

      @result << ""
    end

    @result << "endif"
    puts @result.join("\n")
  end
end

SongsBuilder.new.process!
