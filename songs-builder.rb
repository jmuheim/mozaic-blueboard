require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
  gem 'nokogiri'
end

puts `pandoc -s -o song.html songs/wish-you-were-here.md --metadata title="No title"`

step = 1
result = []

doc = File.open("song.html") { |f| Nokogiri::Slop(f) }

doc.html.body.h2.each_with_index do |h2, i|
  result << "// #{h2.text}"

  table = doc.html.body.table[i + 1] # See https://stackoverflow.com/questions/65576289/
  table.tbody.tr.each do |tr|
    next if tr.is_a?(Array) # See https://stackoverflow.com/questions/65576168/

    part     = tr.td[0].text
    prepare  = tr.td[1].text
    activate = tr.td[2].text

    result << "if step = #{step} // #{part}"

    step += 1
  end
end

puts result.join("\n")

# result = File.open("index.html").read
#
# result.gsub!("<body>", '<body><input type="checkbox" id="toggle-chords-visibility" /><label for="toggle-chords-visibility"></label><a href="#" id="toggle-theme" onclick="document.getElementById(\'theme\').setAttribute(\'href\',\'revealjs/style/theme/serif.css\'); return false;"></a><a href="#/1" id="go-to-toc"></a>')
# result.gsub!('<style>', '<style>' + File.open("style/night.css").read + File.open("style/shared.css").read)
#
# file = File.open("index.html", "w")
# file.write(result)
# file.close
#
# # Word
# # puts `pandoc -s -o songs.docx all-songs.md --no-highlight --toc --toc-depth=1`
#
# # Powerpoint
# # puts `pandoc -s -o songs.pptx all-songs.md --slide-level=2`
#
# # Printable song book
# puts `pandoc -t revealjs -s -o print.html all-songs.md --slide-level=2 --no-highlight --toc --toc-depth=1 -V theme=serif -V progress=false -V revealjs-url=./style/revealjs`
#
# result = File.open("print.html").read
#
# result.gsub!('<style>', '<style>' + File.open("style/serif.css").read + File.open("style/shared.css").read) # Add
# result.gsub!(/<section id="resources[-\d]*?" class="slide level2">(.*?)<\/section>/m, "") # Remove "Resources" slides (they contain links that are useless/ugly in a printed document)
# result.gsub!('<section id="title-slide"', '<section id="title-slide" data-background-image="style/background.jpg"') # Add background to title slide
#
# file = File.open("print.html", "w")
# file.write(result)
# file.close
#
# print_file = "#{URI::encode(File.expand_path(File.dirname(__FILE__))).to_s}/print.html"
# puts `decktape -s 1600x1200 file://#{print_file} print.pdf`
