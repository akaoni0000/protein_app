# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

userNames = ["aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg", "hhh", "iii", "jjj", "kkk", "lll", "mmm", "nnn", "ooo", "ppp"]
i = 1
userNames.each do |name|
    User.create(name: name, email: "#{i}@gmail.com", password: "aaaaaa", password_confirmation: "aaaaaa")
    i += 1
end 

for num in 2..userNames.length do
    Relation.create(follow_id: 1, followed_id: num)
end


proteinTaste = ["ココア", "チョコ", "抹茶", "ヨーグルト", "バニラ", "ピーチ", "カフェオレ", "その他"]
for num in 1..30 do
    Protein.create(name: "テスト", user_id: rand(1..5), taste: proteinTaste.sample, feature: "牛乳に溶かして飲むと美味しいです", price: 3000, protein_images: nil, weight: 2000, protein_weight: 1300, large_weight: 5000, ratio: 1300*100/2000)
end
