class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            message = "Something went wrong!"
            redirect_to new_user_path
        end
    end

    

end 