# Userデータ
FactoryBot.define do
    factory :user do 
        sequence(:name) { |n| "user_#{n}"}
        sequence(:email) { |n| "test#{n}@gmail.com" }
        password {"aaaaaa"}
    end
end