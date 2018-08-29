require 'pdf/reader'

reader = PDF::Reader.new("lorem.pdf")

paragraph = ""
paragraphs = []
reader.pages.each do |page|
  clean = page.text.delete("\n")
  lines = clean.scan(/[^\.\!\?]*[\.\!\?]/)
  # p lines
  p lines[3]

end

