class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path, notice: "You can now login."
        else
            flash.alert = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(params[:id])
    end


    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end