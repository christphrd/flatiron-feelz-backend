# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(first_name: "911", last_name: "911", email: "911", password: "911", password_confirmation: "911")
user2 = User.create(first_name: "123", last_name: "123", email: "123", password: "123", password_confirmation: "123")
user3 = User.create(first_name: "Chris", last_name: "Diep", email:"chris", password: "chris", password_confirmation: "chris")
post1 = Post.create(user_id: 1, feelings: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
post2 = Post.create(user_id: 1, feelings: "Awesome...nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
post3 = Post.create(user_id: 1, feelings: "=(")
