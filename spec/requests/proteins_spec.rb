require 'rails_helper'

RSpec.describe "Proteinsコントローラーのテスト", type: :request do
    it "new" do
        @user = FactoryBot.create(:user)
        get new_protein_path
        expect(response.status).to eq 200;
    end
    it "create" do
        @user = FactoryBot.create(:user)
        @current_user = @user
        binding.pry
        #保存成功
        post proteins_path, :params => { :protein => { :name => "テスト", :feature => "おいしいです", :price => 3000, :taste => "ココア", :protein_weight => 300, :weight => 400, :large_weight => 3000}}
        expect(response.status).to eq 302;
        #保存失敗
        post proteins_path, :params => { :protein => { :name => "", :feature => "おいしいです", :price => 3000, :taste => "ココア", :protein_weight => 300, :weight => 400, :large_weight => 3000}}
        expect(response.status).to eq 200;
    end
end
