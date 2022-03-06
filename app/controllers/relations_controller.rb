class RelationsController < ApplicationController

    def follow
        @current_user.createFollow(params[:id])
        @user_id = params[:id] #新しくリングを作成するのに使用 フォローされるユーザーのid
        @user = User.find(params[:page_user_id]) #showページのユーザー
    end

    def unfollow
        @current_user.destroyFollow(params[:id])
        @user_id = params[:id]
        @user = User.find(params[:page_user_id]) #showページのユーザー
    end

end
