class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            continue
        else
            render :new
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :department)
    end

end