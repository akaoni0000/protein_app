class ProteinsController < ApplicationController

    include AjaxHelper

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
            set_error_messages
            render "new"
        end
    end

    def show
        @protein = Protein.find(params[:id])
        @comment = Comment.new
        @comments = @protein.comments
    end

    def edit
        @protein = Protein.find(params[:id])
        if @protein.user_id != @current_user.id
            redirect_to user_path(@current_user.id)
        end 
    end

    def update
        @new_protein = Protein.new(protein_params)
        @new_protein.id = params[:id]
        @protein = Protein.find_by(id: params[:id], user_id: @current_user.id)
        @protein.protein_images.push(@new_protein.protein_images)
        @protein.protein_images.flatten!
        @protein.name = @new_protein.name
        @protein.feature = @new_protein.feature
        @protein.price = @new_protein.price
        @protein.height = @new_protein.height
        @protein.protein_height = @new_protein.protein_height
        @protein.taste = @new_protein.taste

        if @protein.save
            flash[:notice] = "プロテイン情報を更新しました"
            redirect_to protein_path(params[:id])
        else 
            set_error_messages
            render "edit"
        end
    end

    def index
        @proteins = Protein.all
    end

    def destroy
    end

    def image_destroy
        @protein = Protein.find(params[:protein_id])
        if @current_user.id != @protein.user_id
            redirect_to root_path
        end
        @protein.protein_images.delete_at(params[:arry_num].to_i)
        @protein.save
        @form_id = params[:arry_num].to_i + 1
    end

    def set_error_messages
        gon.name_error_messages = @protein.errors.full_messages_for(:name)
        gon.feature_error_messages = @protein.errors.full_messages_for(:feature)
        gon.price_error_messages = @protein.errors.full_messages_for(:price)
        gon.height_error_messages = @protein.errors.full_messages_for(:height)
        gon.protein_height_error_messages = @protein.errors.full_messages_for(:protein_height)
        gon.large_height_error_messages = @protein.errors.full_messages_for(:large_height)
        gon.taste_error_messages = @protein.errors.full_messages_for(:taste)
    end
    
    def protein_params
        params.require(:protein).permit(:name, :feature, :price, :taste, :protein_height, :height, :large_height, protein_images:[])
    end
end
