class ProteinsController < ApplicationController

    def new
        @protein = Protein.new
    end

    def create
        @protein = Protein.new(protein_params)
        @protein.user_id = @current_user.id
        if @protein.save
            flash[:notice] = "新しいプロテインを投稿しました"
            redirect_to user_path(@current_user.id)
        else
            flash[:notice] = "投稿に失敗"
            redirect_to root_path
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def index
    end

    def destroy
    end
    
    def protein_params
        params.require(:protein).permit(:name, :feature, :price, :protein_height, :height, protein_images:[])
    end
end
