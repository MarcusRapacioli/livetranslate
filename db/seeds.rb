# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting all"

StudentLesson.destroy_all
Section.destroy_all
Order.destroy_all
Document.destroy_all
Lesson.destroy_all
User.destroy_all

puts "Creating Durham Uni"

User.create!(first_name: "Professor", last_name: "Sprague", email: "wes@me.com", password: "moolah", user_type: "Teacher", institution: "Durham Uni")
User.create!(first_name: "Warren", last_name: "Buffet", email: "warren@me.com", password: "moolah", user_type: "Business", institution: "Berkshire Hathaway")

georges = User.create!(first_name: "Georges", last_name: "Haines", email: "georges@me.com", password: "moolah", user_type: "Student", institution: "Durham Uni")
ben = User.create!(first_name: "Ben", last_name: "Riley", email: "ben@me.com", password: "moolah", user_type: "Student", institution: "Durham Uni")
ross = User.create!(first_name: "Ross", last_name: "Kerr", email: "ross@me.com", password: "moolah", user_type: "Student", institution: "Durham Uni")
katie = User.create!(first_name: "Katie", last_name: "Pitcher", email: "katie@me.com", password: "moolah", user_type: "Student", institution: "Durham Uni")
lizzie = User.create!(first_name: "Lizzie", last_name: "Dilks", email: "lizzie@me.com", password: "moolah", user_type: "Student", institution: "Durham Uni")


russian = Lesson.create!(lesson_name: "Russian - Beginners", teacher: User.first)
italian = Lesson.create!(lesson_name: "Italian - Intermediate", teacher: User.first)
japanese = Lesson.create!(lesson_name: "Japanese - Advanced", teacher: User.first)
french = Lesson.create!(lesson_name: "French - Beginners", teacher: User.first)

[georges, ben, ross, katie, lizzie].each do |student|
  StudentLesson.create!(student: student, lesson: russian)
  StudentLesson.create!(student: student, lesson: italian)
  StudentLesson.create!(student: student, lesson: french)
  StudentLesson.create!(student: student, lesson: japanese)
end

puts "Finished"
