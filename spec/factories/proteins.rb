FactoryBot.define do
    factory :protein do 
        sequence(:name) { |n| "protein_#{n}"}
        user_id {1}
        feature {"おいしいです"}
        taste {"ココア"}
        price {3000}
        protein_weight {100}
        weight {120}
        large_weight {3000}
        ratio {80}
    end
end