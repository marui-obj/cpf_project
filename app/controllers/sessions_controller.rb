class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to departments_path
        else
            message = "Something went wrong! redirect to register"
            redirect_to new_user_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end

    

end 