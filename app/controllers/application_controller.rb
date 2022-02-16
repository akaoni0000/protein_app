class ApplicationController < ActionController::Base
    before_action :set_login_user
    before_action :redirect_root, except: [:top, :login, :user_login, :new, :create] 
    
    def set_login_user
        @current_user = User.find_by(id: session[:user_id]) #find(session[])とすると必ずsessionに値がなければならない
    end

    def redirect_root
        if @current_user == nil
            redirect_to root_path
        end
    end
end
