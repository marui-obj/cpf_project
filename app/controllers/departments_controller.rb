class DepartmentsController < ApplicationController
    before_action :authorize

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


    private
    
    def department_params
        params.require(:department).permit(:title, :manager)
    end
    
end
