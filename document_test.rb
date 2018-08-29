require 'pdf/reader'

reader = PDF::Reader.new("lorem.pdf")

sentence_array = []
reader.pages.each do |page|
  clean = page.text.delete("\n")
  sentence_array << clean.scan(/[^\.\!\?]*[\.\!\?]/)
end

sentences = sentence_array.flatten

students = %w[donald ivanka theresa jeremy]

number_of_sentences = sentences.count

x = number_of_sentences / students.count

h = Hash[students.map {|student| [student, x]}]

remainder = number_of_sentences % students.count

# lucky_student = students.sample
if remainder != 0
  students_dup = h.dup
  unlucky_students = h.dup
  (students.count - remainder).times do
    random_student = students_dup.keys.sample
    unlucky_students.delete(random_student)
    students_dup.delete(random_student)
  end

  unlucky_students.each do |student, _count|
    h[student] += 1
  end
end

sections = []

h.values.each do |num|
  part = sentences.slice(0, num)
  sentences -= part
  sections.push(part)
end

new_hash = {}
students.each do |student|
  section = sections.first
  new_hash[student] = section
  sections.delete(section)
end


p new_hash['donald']
puts " ------------------"
p new_hash['ivanka']
puts " ------------------"
p new_hash['theresa']
puts " ------------------"
p new_hash['jeremy']
puts " ------------------"



# p h.values # => [7, 7, 7, 6]

# first_para = sentences.first(h.values[0])
# first_sentence_index = sentences.index(first_para.last)
# second_para = sentences[((first_sentence_index + 1)..(first_sentence_index + (h.values[1])))]
# second_sentence_index = sentences.index(second_para.last)

# p first_para
# p second_para
# p second_sentence_index

# students.count.times do
#   counter = -1
#   para = sentences.first(h.values[counter += 1])
#   if counter >= 0
#     sentence_index = sentences.index(para.last)
#     para = sentences[((sentence_index + 1)..(sentence_index + (h.values[counter += 1])))]
#   end
#   p para

# end
# p sentences
# p h

