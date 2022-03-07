class HomesController < ApplicationController
    def top
        @proteins = Protein.first(6)
    end

    def user_login
        if @current_user.present?
            redirect_to root_path
        end
    end
end
