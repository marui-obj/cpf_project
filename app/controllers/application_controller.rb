class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(:id => session[:user_id])
        puts("EIEI")
        puts(session[:user_id])
        if session[:user_id]
            @current_user ||= User.find_by(:id => session[:user_id])
        else
            @current_user = nil
        end
    end

    def authorize
        redirect_to '/login' unless self.current_user
    end

end
