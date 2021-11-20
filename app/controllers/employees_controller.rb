class EmployeesController < ApplicationController
    require 'date'
    @@utc = '+7'

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

    def show
        @user = User.find_by(params[:id])
    end

    def index
        @employee = current_user.employee
    end

    def update
        @employee = current_user.employee
        if params.value?("Check in")
            check_in
        elsif params.value?("Check out")
            check_out
        end
        redirect_to employees_path
    end

    def today?(me)
        me == Date.today        
    end
    helper_method :today?

    private

    def employee_params
        params.require(:employee).permit(:name, :department)
    end

    def check_in
        work_id = eval(params.to_s).invert["Check in"].sub(/check_in_/,"").to_i
        @work = @employee.workactuals.find(work_id)
        if @work.check_in.nil?
            now = DateTime.now
            @work.update(:check_in=>now)
            flash[:notice] = "You checked in at #{now.strftime('%t%H:%M')}"
        else
            flash[:notice] = "You have already checked in."
        end
    end

    def check_out
        work_id = eval(params.to_s).invert["Check out"].sub(/check_out_/,"").to_i
        puts work_id
        @work = @employee.workactuals.find(work_id)
        unless @work.check_in.nil?
            if @work.check_out.nil?
                now = DateTime.now
                @work.update(:check_out=>now)
                calculate_ot
                flash[:notice] = "You checked out at #{now.strftime('%t%H:%M')}"
            else
                flash[:notice] = "You have already checked out."
            end
        else
            flash[:notice] = "You have to check in first before check out."
        end
    end

    def calculate_ot
        plan_check_out = Workplan.find(@work.id).check_out
        actual_check_out = @work.check_out
        ot_amount = (actual_check_out - plan_check_out)/3600.0
        if ot_amount.negative?
            ot_amount = 0
        end
        @work.update(:overtime=>ot_amount.round(2))
    end       

end