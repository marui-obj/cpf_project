class DepartmentsController < ApplicationController
    before_action :authorize
    before_action :can_enter?
    skip_before_action :verify_authenticity_token
    

    def new
        @department = Department.new
    end

    def create
        flash.notice = date_param;
        redirect_to departments_path
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

    def date_param
        params[:date]
    end
    

    
end
