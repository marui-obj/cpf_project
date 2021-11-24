class DepartmentsController < ApplicationController
    before_action :authorize
    before_action :can_enter?
    

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(department_params)
        if @department.save
            continue
        else
            render :new
        end
    end

    def index
        # flash.notice = params[:date]
        @departments = Department.all
    end

    def show
        id = params[:id]
        # begin
        @department = Department.find(id)

        # rescue
        #     redirect_to departments_path

        # end
    end

    def change_day
        day = params[:date]
        
    end


    private

    def date_param
        params[:date_param].blank?
    end
    
    def department_params
        params.require(:department).permit(:title, :manager)
    end
    
end
