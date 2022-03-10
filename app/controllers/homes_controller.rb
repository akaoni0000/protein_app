class HomesController < ApplicationController
    def top
        @proteins = Protein.all.sort { |a,b| b.favorites.count <=> a.favorites.count }.first(8)
    end

    def user_login
        if @current_user.present?
            redirect_to root_path
        end
    end
end
