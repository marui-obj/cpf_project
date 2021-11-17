class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :set_cache_headers

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(:id => session[:user_id])
        else
            @current_user = nil
        end
    end

    def authorize
        redirect_to '/login' unless self.current_user
    end

    private

    def set_cache_headers
        response.headers["Cache-Control"] = "no-cache, no-store"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
    end

end
