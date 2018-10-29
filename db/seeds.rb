# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'te@test.com', password: '123456')
User.create(email: 'tes@test.com', password: '123456')
User.create(email: 'test@test.com', password: '123456')
User.create(email: 'testi@test.com', password: '123456')
User.create(email: 'testin@test.com', password: '123456')
User.create(email: 'testig@test.com', password: '123456')

TodoList.create(title: 'testing1', description: 'testing description 1', done_homework: 1, user_id: 2)
TodoList.create(title: 'testing2', description: 'testing description 2', done_homework: 1, user_id: 3)
TodoList.create(title: 'testing3', description: 'testing description 3', done_homework: 1, user_id: 4)
TodoList.create(title: 'testing4', description: 'testing description 4', done_homework: 1, user_id: 5)
TodoList.create(title: 'testing5', description: 'testing description 5', done_homework: 1, user_id: 2)
TodoList.create(title: 'testing6', description: 'testing description 6', done_homework: 1, user_id: 3)
TodoList.create(title: 'testing7', description: 'testing description 7', done_homework: 1, user_id: 4)