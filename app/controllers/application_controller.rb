class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :set_cache_headers
    before_action :login_path_before_session_destroy?
    include SessionsHelper
    
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

    def login_path_before_session_destroy?
        if request.path == login_path
            if is_manager?
                redirect_to departments_path
            elsif is_employee?
                redirect_to employees_path
            end
        end
    end

    def can_enter?
        if is_employee?
            redirect_to employees_path, alert: "Permission Denied."
        end
    end

    private

    def set_cache_headers
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end

end
