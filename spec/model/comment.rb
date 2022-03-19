require 'rails_helper'

describe "commnetモデルのテスト"  do  
    user = FactoryBot.create(:user)
    protein = FactoryBot.create(:protein)
    comment = FactoryBot.create(:comment)

    context "保存成功" do
        it "保存成功" do
            expect(user.valid?).to eq true;
        end
    end

    context "commentカラムのテスト" do
        it "nilは保存されない" do
            comment.comment = ""
            expect(comment.valid?).to eq false;
        end
    end
    
   

    after(:all) do
        DatabaseCleaner.clean_with(:truncation)
    end
end
