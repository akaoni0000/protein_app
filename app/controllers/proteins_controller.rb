class ProteinsController < ApplicationController

    def new
        @protein = Protein.new
    end

    def create
        @protein = Protein.new(protein_params)
        @protein.user_id = @current_user.id
        if @protein.protein_weight.present? && @protein.weight.present?
            @protein.ratio = @protein.protein_weight * 100 / @protein.weight
        end
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

        #配列調整
        @protein_image_array = []
        for num in 0..@protein.protein_images.length-1
            @protein_image_array.push(0)
        end
        session[:protein_image_array] = @protein_image_array
        #配列調整ここまで
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
        @protein.weight = @new_protein.weight
        @protein.protein_weight = @new_protein.protein_weight
        if @protein.protein_weight.present? && @protein.weight.present?
            @protein.ratio = @new_protein.protein_weight * 100 / @new_protein.weight
        end
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
        @proteins = Protein.all.page(params[:page]).per(8)
        if params[:special].present? #お気に入りのプロテイン
            protein_id = @current_user.favorites.pluck(:protein_id)
            @proteins = Protein.where(id: protein_id).page(params[:page]).per(8)
        end
    end

    def destroy
        @protein = Protein.find(params[:id])
        @protein.destroy
        flash[:notice] = "プロテイン情報を削除しました"
        redirect_to user_path(@current_user.id)
    end

    def image_destroy
        @protein = Protein.find(params[:protein_id])
        if @current_user.id != @protein.user_id
            redirect_to root_path
        end

        #配列調整
        if params[:arry_num].to_i == 0 
            @del_arry_num = params[:arry_num].to_i
        else
            @del_arry_num = session[:protein_image_array].slice(0..params[:arry_num].to_i-1).count(0)
        end
        session[:protein_image_array][params[:arry_num].to_i] = 1
        #配列調整ここまで

        @protein.protein_images.delete_at(@del_arry_num)
        @protein.save
        @form_id = params[:arry_num].to_i
    end

    def search
        @proteins = []
    
        #味で検索
        taste = params[:taste]
        @proteinsTaste = Protein.where(taste: taste)

        #値段で検索
        price = params[:price]
        @proteinsPrice = Protein.where(price: price[0].to_i..price[1].to_i)

        #内容量で検索
        large_weight = params[:large_weight]
        @proteinsLargeWeight = Protein.where(large_weight: large_weight.to_i..Float::INFINITY)
        
        #タンパク質含有量で検索
        ratio = params[:protein_ratio]
        @proteinsRatio = Protein.where(ratio: ratio[0].to_i..ratio[1].to_i)

        @proteins.push(@proteinsTaste & @proteinsPrice & @proteinsLargeWeight & @proteinsRatio).flatten!.uniq!
        render "index"
    end

    def set_error_messages
        gon.name_error_messages = @protein.errors.full_messages_for(:name)
        gon.feature_error_messages = @protein.errors.full_messages_for(:feature)
        gon.price_error_messages = @protein.errors.full_messages_for(:price)
        gon.weight_error_messages = @protein.errors.full_messages_for(:weight)
        gon.protein_weight_error_messages = @protein.errors.full_messages_for(:protein_weight)
        gon.large_weight_error_messages = @protein.errors.full_messages_for(:large_weight)
        gon.taste_error_messages = @protein.errors.full_messages_for(:taste)
    end
    
    def protein_params
        params.require(:protein).permit(:name, :feature, :price, :taste, :protein_weight, :weight, :large_weight, protein_images:[])
    end
end
