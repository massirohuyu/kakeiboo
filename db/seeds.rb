# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create({ id: 1, uid: 'admin', name: '管理者', password: 'password', password_confirmation: 'password' })
item = Item.create({ id: 1, name: 'テスト費目', kind: 0 })
detail = Detail.create({ id: 1, item_id: 1, name: 'テスト内訳' })
book = Book.create({ id: 1, name: 'テスト会計簿' })

user.books << book
user.save!
