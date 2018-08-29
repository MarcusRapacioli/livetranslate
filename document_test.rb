require 'pdf-reader'

reader = PDF::Reader.new("test one page.pdf")

# puts reader.page_count


# reader.pages.each do |page|
#   puts page.text
# end


# reader.pages.each do |page|
#   page.delete(/\n/, '')
#   p page.text
# end

# # p paragraph


paragraph = ""
paragraphs = []
reader.pages.each do |page|
  lines = page.text.scan(/\n\n/)
  # p lines
  # lines.each do |line|
  #   if line.length > 55
  #     paragraph += " #{line}"
  #   else
  #     paragraph += " #{line}"
  #     paragraphs << paragraph
  #     paragraph = ""
  #   end
end

# p paragraphs

# text = File.read "test.txt"
# p text.scan(/[^\.!?]+[\.!?]/).map(&:strip)

# puts "#{text.split("\n").size} lines."
# paragraphs = text.split ".\n"
# puts "#{paragraphs.length} paragraphs."


# p paragraphs

ARGV.each do |lorem|
  PDF::Reader.open(lorem) do |reader|
    puts "Converting : #{lorem}"
    pageno = 0
    txt = reader.pages.map do |page|
      pageno += 1
      begin
        print "Converting Page #{pageno}/#{reader.page_count}\r"
        page.text
      rescue
        puts "Page #{pageno}/#{reader.page_count} Failed to convert"
        ''
      end
    end # pages map
    puts "\nWriting text to disk"
    File.write lorem+'.txt', txt.join("\n")
  end # reader
end # each
