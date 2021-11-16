module SessionsHelper
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    def is_manager?
        logged_in? ? current_user.manager : false
    end

    def is_employee?
        logged_in? ? current_user.employee : false
    end

 
 end