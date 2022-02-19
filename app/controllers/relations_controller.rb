class RelationsController < ApplicationController

    def follow
        @current_user.createFollow(params[:id])
        @user_id = params[:id]
        @num = params[:num]
    end

    def unfollow
        @current_user.destroyFollow(params[:id])
        @user_id = params[:id]
        @num = params[:num]
    end


end
