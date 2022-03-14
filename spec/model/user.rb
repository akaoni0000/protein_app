require 'rails_helper'

describe "Userモデルのテスト"  do  
    user = FactoryBot.create(:user)

    context "保存成功" do
        it "保存成功" do
            expect(user.valid?).to eq true;
        end
    end
    
    context "nameカラム" do
        it "1文字以上10文字以下" do
            user.name = "あああああああああああああ"
            expect(user.valid?).to eq false;
        end
        it "0文字" do
            user.name = ""
            expect(user.valid?).to eq false;
        end
        it "重複" do
            user2 = FactoryBot.build(:user)
            user2.name = "user_1"
            expect(user.valid?).to eq false;
        end
    end
    
    context "emailカラム" do
        it "0文字" do
            user.email = ""
            expect(user.valid?).to eq false;
        end
        it "重複" do
            user2 = FactoryBot.build(:user)
            user2.email = "test1@gmail.com"
            expect(user.valid?).to eq false;
        end
    end

    after(:all) do
        DatabaseCleaner.clean_with(:truncation)
    end
end
