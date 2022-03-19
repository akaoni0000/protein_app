require 'rails_helper'

describe "Userモデルのテスト"  do 
    user = FactoryBot.create(:user) #proteinのuser_idに入れる
    protein = FactoryBot.create(:protein)

    context "保存成功" do
        it "保存成功" do
            expect(protein.valid?).to eq true;
        end
    end
    
    context "nameカラム" do
        it "nilは保存されない" do
            protein.name = ""
            expect(protein.valid?).to eq false;
        end
    end
    
    context "featureカラム" do
        it "5文字以上" do
            protein.feature = "ああああ"
            expect(protein.valid?).to eq false;
        end
    end

    context "priceカラム" do
        it "100以上30000以下" do
            protein.price = 10
            expect(protein.valid?).to eq false;
            protein.price = 30000000
            expect(protein.valid?).to eq false;
        end
    end

    context "weightカラム" do
        it "nilは保存されない" do
            protein.weight = ""
            expect(protein.valid?).to eq false;
        end
    end

    context "protein_weightカラム" do
        it "nilは保存されない" do
            protein.protein_weight = ""
            expect(protein.valid?).to eq false;
        end
    end

    context "large_weight" do
        it "nilは保存されない" do
            protein.large_weight = ""
            expect(protein.valid?).to eq false;
        end
        it "100以上30000以下" do
            protein.price = 10
            expect(protein.valid?).to eq false;
            protein.price = 30000000
            expect(protein.valid?).to eq false;
        end
    end

    after(:all) do
        DatabaseCleaner.clean_with(:truncation)
    end

end
