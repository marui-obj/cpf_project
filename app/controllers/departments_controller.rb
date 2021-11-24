class DepartmentsController < ApplicationController
    before_action :authorize
    before_action :can_enter?
    before_action :your_department?, only: [:show]
    skip_before_action :verify_authenticity_token
    @@date_value = Time.now.strftime("%d-%m-%Y")

    def new
        @department = Department.new
    end

    def create
        flash.notice = date_param;
        @@date_value = date_param;
        redirect_to departments_path
    end

    def index
        @date_value = @@date_value
        @departments = Department.all
    end

    def show
        id = params[:id]
        # begin
        @date_value = @@date_value
        @department = Department.find(id)

        # rescue
        #     redirect_to departments_path
        # end
    end




    private

    def date_param
        params[:date]
    end

    def your_department?
        department = Department.find(params[:id])
        unless department.manager.user == current_user
            flash[:notice] = "This department doesn't belong to you."
            redirect_to departments_path
        end
    end
    

    
end
