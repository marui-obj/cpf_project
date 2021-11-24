class DepartmentsController < ApplicationController
    before_action :authorize
    before_action :can_enter?
    before_action :your_department?, only: [:show]

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


    private
    
    def department_params
        params.require(:department).permit(:title, :manager)
    end

    def your_department?
        department = Department.find(params[:id])
        unless department.manager.user == current_user
            flash[:notice] = "This department doesn't belong to you."
            redirect_to departments_path
        end
    end
    
end
