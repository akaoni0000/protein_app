class UsersController < ApplicationController

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            flash[:notice] = "ログインに成功しました"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:notice] = "メールアドレスまたはパスワードが違います"
            redirect_to user_login_path
        end
    end

    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        @current_user = nil
        redirect_root #メソッド
    end

    def new
        if @current_user.present?
            redirect_to root_path
        end
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path
        end
    end

    def show
    end

    def edit
    end

    def updated
    end


    

    private
    def user_params
        params.require(:user).permit(:name, :email, :avatar_image, :password, :password_confirmation)
    end
end
