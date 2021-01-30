# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all

ray = User.create!(first_name: "Raynaldo", last_name: "Sutisna", username: "raynaldo", email: "raynaldo_sutisna@example.com", password: "123", picture: "")
post = Post.create!(title: "Welcome", body: "hello world", user_id: ray.id)
