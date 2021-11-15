class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to departments_path, notice: "Welcome: " + current_user.username
        elsif !!@user && !@user.authenticate(params[:password])
            redirect_to login_path, alert: "Incorrect username or password."
        else
            redirect_to new_user_path, alert: "No User found."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/login', notice: "Logout!"
    end

    

end 