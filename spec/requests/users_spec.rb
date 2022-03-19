require 'rails_helper'

RSpec.describe "usersコントローラーのテスト", type: :request do
    it "login" do
        @user = FactoryBot.create(:user)
        post users_login_path(email:"test1@gmail.com", password: "aaaaaa")
        expect(response.status).to eq 302; 
    end
    it "logout" do
        post users_logout_path
        expect(response.status).to eq 302;
    end
    it "new" do
        get new_user_path
        expect(response.status).to eq 200;
    end
    it "create" do
        #保存成功
        post users_path, :params => { :user => { :name => "aaa", :email => "test@gmail.com", :introduction => "よろしく", :password => "aaaaaa", :password_confirmation => "aaaaaa"}}
        expect(response.status).to eq 302;
        #保存失敗
        post users_path, :params => { :user => { :name => "", :email => "test@gmail.com", :introduction => "よろしく", :password => "aaaaaa", :password_confirmation => "aaaaaa"}}
        expect(response.status).to eq 200;
    end
    it "show" do
        @user = FactoryBot.create(:user)
        get user_path(@user.id)
        expect(response.status).to eq 200;
    end
    it "update" do
        @user = FactoryBot.create(:user)
        @current_user = @user
        #アップデート成功
        patch user_path(1), :params => { :user => { :name => "aaa", :email => "test@gmail.com", :introduction => "よろしく", :password => "aaaaaa", :password_confirmation => "aaaaaa"}}
        expect(response.status).to eq 302;
        #アップデート失敗
        post users_path, :params => { :user => { :name => "", :email => "test@gmail.com", :introduction => "よろしく", :password => "aaaaaa", :password_confirmation => "aaaaaa"}}
        expect(response.status).to eq 200;
    end
    it "destroy_image" do
        @user = FactoryBot.create(:user)
        @current_user = @user
        post users_destroy_image_path
        expect(response.status).to eq 302;
    end

    after(:all) do
        DatabaseCleaner.clean_with(:truncation)
    end
end
