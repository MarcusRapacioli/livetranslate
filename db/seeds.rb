# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Document.destroy_all
Lesson.destroy_all
Section.destroy_all
StudentLesson.destroy_all

User.create!(first_name: "Donald", last_name: "Trump", email: "donald@me.com", password: "moolah123", user_type: "Teacher", institution: "Trump U")
User.create!(first_name: "Ivanka", last_name: "Trump", email: "ivanka@me.com", password: "moolah123", user_type: "Student", institution: "Trump U")
User.create!(first_name: "Vlad", last_name: "Putin", email: "vlad@me.com", password: "moolah123", user_type: "Business", institution: "Kremlin")
User.create!(first_name: "Jared", last_name: "Trump", email: "jared@me.com", password: "moolah123", user_type: "Teacher", institution: "Trump U")


Lesson.create!(lesson_name: "Art of the deal", teacher: User.first)
Lesson.create!(lesson_name: "property 101", teacher: User.last)

