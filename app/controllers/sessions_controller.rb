class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include SessionsHelper
    
    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            if is_manager?
                # if login as manager
                redirect_to departments_path, notice: "Welcome manager: " + current_user.username
            elsif is_employee?
                # if login as employee
                redirect_to employees_path, notice: "Welcome employee: " + current_user.username
            else
                # if this account is currently not assign role
                session.delete(:user_id)
                redirect_to login_path, alert: "Something went Wrong. Contact admin for more information. "
            end
        elsif !!@user && !@user.authenticate(params[:password])
            redirect_to login_path, alert: "Incorrect username or password."
        else
            redirect_to login_path, alert: "No User found."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path, notice: "Logout!"
    end

    

end 