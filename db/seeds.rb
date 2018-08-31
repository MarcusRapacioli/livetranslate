# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudentLesson.destroy_all
Section.destroy_all
Document.destroy_all
Lesson.destroy_all
User.destroy_all

User.create!(first_name: "Donald", last_name: "Trump", email: "donald@me.com", password: "moolah123", user_type: "Teacher", institution: "Trump U")
ivanka = User.create!(first_name: "Ivanka", last_name: "Trump", email: "ivanka@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")
User.create!(first_name: "Vlad", last_name: "Putin", email: "vlad@me.com", password: "moolah123", user_type: "Business", institution: "Kremlin")
User.create!(first_name: "Jared", last_name: "Trump", email: "jared@me.com", password: "moolah123", user_type: "Teacher", institution: "Trump U")


jeremy = User.create!(first_name: "Jeremy", last_name: "Trump", email: "jeremy@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")
theresa = User.create!(first_name: "Theresa", last_name: "Trump", email: "theresa@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")
nigel = User.create!(first_name: "Nigel", last_name: "Trump", email: "nigel@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")
boris = User.create!(first_name: "Boris", last_name: "Trump", email: "boris@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")
jacob = User.create!(first_name: "Jacob", last_name: "Trump", email: "jacob@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")


russian = Lesson.create!(lesson_name: "Russian 2A", teacher: User.first)
american = Lesson.create!(lesson_name: "American 1A", teacher: User.first)
french = Lesson.create!(lesson_name: "French 3A", teacher: User.third)

[jeremy, theresa, nigel, boris, jacob, ivanka].each do |student|
  StudentLesson.create!(student: student, lesson: russian)
  StudentLesson.create!(student: student, lesson: american)
  StudentLesson.create!(student: student, lesson: french)
end


