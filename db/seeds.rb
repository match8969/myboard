# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: "administer@example.com",
    password: "administer",
    confirmed_at: Time.zone.now-1.month
   )


10.times do |n|
    User.create!(email: "example_#{n+1}@example.com",
                 password: "password",
                 confirmed_at: Time.zone.now-1.month
                )
end


Talent.create!(name: "町田", user_id: 1)
Talent.create!(name: "近藤麻理恵", user_id: 1)
Talent.create!(name: "渡辺直美", user_id: 1)
Talent.create!(name: "有吉弘行", user_id: 1)
Talent.create!(name: "ローラ", user_id: 1)

InstagramAccount.create!(account_name: "match8969", talent_id: 1)
InstagramAccount.create!(account_name: "mariekondo", talent_id: 2)
InstagramAccount.create!(account_name: "watanabenaomi703", talent_id: 3)
InstagramAccount.create!(account_name: "ariyoshihiroiki", talent_id: 4)
InstagramAccount.create!(account_name: "rolaofficial", talent_id: 5)




