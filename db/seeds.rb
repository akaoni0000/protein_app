# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "aaa", email: "aaa@gmail.com", password: "aaa", password_confirmation: "aaa") ### pasword_digestカラムでデータを入れると認証でエラーがおこる
User.create(name: "bbb", email: "bbb@gmail.com", password: "aaa", password_confirmation: "aaa")
User.create(name: "ccc", email: "ccc@gmail.com", password: "aaa", password_confirmation: "aaa")
User.create(name: "ddd", email: "eee@gmail.com", password: "aaa", password_confirmation: "aaa")
User.create(name: "eee", email: "ddd@gmail.com", password: "aaa", password_confirmation: "aaa")

Relation.create(follow_id: 1, followed_id: 2)
Relation.create(follow_id: 1, followed_id: 3)
Relation.create(follow_id: 1, followed_id: 4)
Relation.create(follow_id: 2, followed_id: 1)
Relation.create(follow_id: 3, followed_id: 1)
