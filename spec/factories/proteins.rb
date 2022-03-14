FactoryBot.define do
    factory :protein do 
        sequence(:name) { |n| "protein_#{n}"}
        user_id {1}
        feature {"おいしいです"}
        feature {"ココア"}
        price {3000}
        protein_weight {100}
        weight {80}
        large_weight {3000}
        ratio {80}
    end
end