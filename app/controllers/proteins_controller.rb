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
        @proteins = Protein.all.order(updated_at: "DESC").page(params[:page]).per(8)
        if params[:special].present? #お気に入りのプロテイン
            protein_id = @current_user.favorites.pluck(:protein_id)
            @proteins = Protein.where(id: protein_id).page(params[:page]).per(8)
            session[:protein_ids] = protein_id
        else
            session[:protein_ids] = nil
        end

        #セッション情報を削除
        session[:taste] = nil
        session[:price] = nil
        session[:large_weight] = nil
        session[:ratio] = nil
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

        @protein.protein_images.delete_at(@del_arry_num)
        @protein.save
        @form_id = params[:arry_num].to_i
    end

    def search
        if params[:searchName].present? #header上の検索から検索した場合
            searchName = params[:searchName]
            @proteins = Protein.where(['name LIKE ?', "%#{searchName}%"])
        else 
            #味で検索
            taste = params[:taste]
            begin
                taste.delete("0")
            resucue
            end
            if taste == []
                @proteinsTaste = Protein.all
            else 
                @proteinsTaste = Protein.where(taste: taste)
            end

            #値段で検索
            price = params[:price]
            @proteinsPrice = Protein.where(price: price[0].to_i..price[1].to_i)

            #内容量で検索
            large_weight = params[:large_weight]
            @proteinsLargeWeight = Protein.where(large_weight: large_weight.to_i..Float::INFINITY)
            
            #タンパク質含有量で検索
            ratio = params[:protein_ratio]
            @proteinsRatio = Protein.where(ratio: ratio[0].to_i..ratio[1].to_i)

            #共通のものを配列で取り出す これはオブジェクトではなく配列である
            @proteins = @proteinsTaste & @proteinsPrice & @proteinsLargeWeight & @proteinsRatio

            #検索条件を保存
            gon.taste = params[:taste]
            gon.price = params[:price]
            gon.large_weight = params[:large_weight]
            gon.ratio = params[:protein_ratio]
            session[:taste] = params[:taste]
            session[:price] = params[:price]
            session[:large_weight] = params[:large_weight]
            session[:ratio] = params[:protein_ratio]
        end

        #配列でも使用できる
        @proteins = Kaminari.paginate_array(@proteins).page(params[:page]).per(8)
        render "index"
    end

    def sort
        @proteins = Protein.all

        order = params[:order]
        if order == "更新日順"
            @proteins_ids = @proteins.order(updated_at: "DESC").pluck(:id)
            gon.num = 0
        elsif order == "投稿日順"
            @proteins_ids = @proteins.order(created_at: "DESC").pluck(:id)
            gon.num = 1
        elsif order == "いいね順"
            @proteins_ids = @proteins.sort { |a,b| b.favorites.count <=> a.favorites.count }.pluck(:id)
            gon.num = 2
        end

        if session[:taste].present? && session[:price].present? && session[:large_weight].present? && session[:ratio].present?
            #味
            taste = session[:taste]
            taste.delete("0")
            if taste == []
                @proteinsTaste = @proteins.order_as_specified(id: @proteins_ids)
            else 
                @proteinsTaste = @proteins.where(taste: taste).order_as_specified(id: @proteins_ids)
            end

            #値段
            price = session[:price]
            @proteinsPrice = @proteins.where(price: price[0].to_i..price[1].to_i).order_as_specified(id: @proteins_ids)

            #内容量
            large_weight = session[:large_weight]
            @proteinsLargeWeight = @proteins.where(large_weight: large_weight.to_i..Float::INFINITY).order_as_specified(id: @proteins_ids)

            #割合
            ratio = session[:ratio]
            @proteinsRatio = @proteins.where(ratio: ratio[0].to_i..ratio[1].to_i).order_as_specified(id: @proteins_ids)

            #共通
            @proteins = @proteinsTaste & @proteinsPrice & @proteinsLargeWeight & @proteinsRatio

            #検索情報を保存
            gon.taste = session[:taste]
            gon.price = session[:price]
            gon.large_weight = session[:large_weight]
            gon.ratio = session[:ratio]

        elsif session[:protein_ids].present?
            @proteins = @proteins.find(session[:protein_ids])
        else
            @proteins = @proteins.order_as_specified(id: @proteins_ids)
        end
        
        @proteins = Kaminari.paginate_array(@proteins).page(params[:page]).per(8)
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
