class FavoritesController < ApplicationController
    def create
        @favorite = Favorite.create(user_id: @current_user.id, protein_id: params[:protein_id])
        @protein = Protein.find(params[:protein_id])
    end
    def destroy
        @favorite = Favorite.find_by(user_id: params[:id], protein_id: params[:protein_id])
        @favorite.destroy
        @protein = Protein.find(params[:protein_id])
    end
end
