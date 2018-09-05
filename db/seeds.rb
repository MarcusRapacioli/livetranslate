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

puts "Creating Hogwarts"

User.create!(first_name: "Professor", last_name: "Snape", email: "snape@me.com", password: "wizard", user_type: "Teacher", institution: "Hogwarts")
neville = User.create!(first_name: "Neville", last_name: "Longbottom", email: "neville@me.com", password: "wizard", user_type: "Student", institution: "Hogwarts")
User.create!(first_name: "Warren", last_name: "Buffet", email: "waren@me.com", password: "wizard", user_type: "Business", institution: "Berkshire Hathaway")


ron = User.create!(first_name: "Ron", last_name: "Weasley", email: "ron@me.com", password: "wizard", user_type: "Student", institution: "Hogwarts")
harry = User.create!(first_name: "Harry", last_name: "Potter", email: "harry@me.com", password: "wizard", user_type: "Student", institution: "Hogwarts")
hermione = User.create!(first_name: "Hermione", last_name: "Granger", email: "hermione@me.com", password: "wizard", user_type: "Student", institution: "Hogwarts")
draco = User.create!(first_name: "Draco", last_name: "Malfoy", email: "draco@me.com", password: "wizard", user_type: "Student", institution: "Hogwarts")


russian = Lesson.create!(lesson_name: "Russian - Beginners", teacher: User.first)
italian = Lesson.create!(lesson_name: "Italian - Intermediate", teacher: User.first)
parseltongue = Lesson.create!(lesson_name: "Parseltongue - Advanced", teacher: User.first)
french = Lesson.create!(lesson_name: "French - Beginners", teacher: User.first)

[neville, ron, harry, hermione, draco].each do |student|
  StudentLesson.create!(student: student, lesson: russian)
  StudentLesson.create!(student: student, lesson: italian)
  StudentLesson.create!(student: student, lesson: french)
  StudentLesson.create!(student: student, lesson: parseltongue)
end
