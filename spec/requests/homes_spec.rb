require 'rails_helper'

RSpec.describe "homesコントローラーのテスト", type: :request do
    it 'トップ画面を表示' do
        get root_path
        expect(response.status).to eq 200;
    end
    
    it "ユーザーのログイン画面を表示" do
        get login_path
        expect(response.status).to eq 200;
    end
end
