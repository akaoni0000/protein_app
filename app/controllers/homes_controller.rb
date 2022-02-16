class HomesController < ApplicationController
    def top
    end

    def user_login
        if @current_user.present?
            redirect_to root_path
        end
    end
end
