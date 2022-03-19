require 'rails_helper'

RSpec.describe "Relationsコントローラーのテスト", type: :request do
    it "follow" do
        @user = FactoryBot.create(:user)
        @current_user = @user
        post relations_follow_path(1, page_user_id: 1, page_user_id: 1)
        expect(response.status).to eq 302;
    end
    it "unfollow" do
        @user = FactoryBot.create(:user)
        post relations_unfollow_path(1, page_user_id: 1, page_user_id: 1)
        expect(response.status).to eq 302;
    end
end
