module SessionsHelper
    include ApplicationHelper
    def is_manager?
        logged_in? ? current_user.manager : false
    end

    def is_employee?
        logged_in? ? current_user.employee : false
    end

 
 end