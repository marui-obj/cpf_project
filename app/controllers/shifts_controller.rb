class ShiftsController < ApplicationController
    before_action :your_department?
    include SessionsHelper
    @@status = "plan"

    def new
        @shift = Shift.new
    end

    def show
        id = params[:id]
        @shift = Shift.find(id)
        @employee_info = Array.new
        @employee_status = Array.new
        @employee_worktime = Array.new
        @status == @@status
        @shift.department.employees.each do |employee|
            @temp_worktime = 0
            @temp_employee_info = Hash.new
            @temp_employee_info[:id] = employee.id
            @temp_employee_info[:name] = employee.name
            unless employee.workplans.size == 0
                employee.workplans.each do |workplan|
                    # Check Employee Status
                    if overlap?(workplan, @shift)
                        @temp_employee_info[:status] = 'Occupied'
                    else
                        if @temp_employee_info[:status] == '' or @temp_employee_info[:status].nil?
                            @temp_employee_info[:status] = 'Free'
                        end
                    end
                end

                employee.workactuals.each do |workactual|
                    # Calculate Employee Worktime
                    puts workactual.check_out
                    if workactual.check_out.nil?
                        unless workactual.check_in.nil?
                            now = DateTime.now
                            @shift_worktime = (now - workactual.check_in.localtime).abs/3600.0
                        end
                    else same_date?(workactual, @shift)
                        @shift_worktime = (workactual.check_out. - workactual.check_in).abs/3600.0
                        @temp_worktime += @shift_worktime
                    end
                end
            else
                @temp_employee_info[:status] = 'Free'
            end
            @temp_employee_info[:worktime] = @temp_worktime
            @employee_info.append(@temp_employee_info)
        end
    end

    def update
        @id = params[:id]
        @shift = Shift.find(@id)
        @department_id = @shift.department.id

        if params.key?("manage_ot")
            manage_ot
        elsif params.value?("Assign")
            assign_employee
        elsif params.value?("Remove")
            remove_employee
        elsif params.key?("status")
            change
        end
        redirect_to department_shift_path
    end

    def status
        @@status
    end

    helper_method :status

    # def plan
    #     show
    #     @status = "plan"
    # end

    # def actual
    #     show
    #     @status = "actual"
    # end

    private

    def shift_params
        params.require(:shift).permit(:department)
    end

    def overlap?(me, other)
        me.check_in < other.check_out && other.check_in < me.check_out
    end

    def same_date?(me, other)
        me, other = me.check_in.to_date, other.check_in.to_date
        me == other
    end

    def manage_ot
        employee_ids = params[:employee_ids]
        amount = params[:amount]
        begin
            employee_ids.each do |employee_id|
                employee = Employee.find(employee_id)
                work = employee.workplans.find_by(:shift_id=>@id)
                if params[:manage_ot] == "Increase"
                    work.overtime += amount.to_f
                elsif params[:manage_ot] == "Decrease"
                    work.overtime -= amount.to_f
                    if work.overtime.negative?
                        work.overtime = 0
                    end
                end
                work.save
            end
        rescue
        end
    end

    def assign_employee
        assign_key = eval(params.to_s).invert["Assign"].sub(/assign_/,"").to_i
        employee_id = params["employee_id_#{assign_key}".to_sym]
        if @shift.workplans.find_by(:employee_id=>employee_id).nil?
            new_work = Workplan.new(:date=>@shift.date, :check_in=>@shift.check_in, :check_out=>@shift.check_out,:overtime=>0)
            new_work.shift = @shift
            employee = Employee.find(employee_id)
            new_work.employee = employee
            new_work.save
        end
    end

    def remove_employee
        remove_key = eval(params.to_s).invert["Remove"].sub(/remove_/,"").to_i
        employee_id = params["cur_employee_id_#{remove_key}".to_sym]
        employee = Employee.find(employee_id)
        work = @shift.workplans.find_by(:employee_id=>employee_id)
        work.destroy
    end

    def change
        @@status = params[:status].downcase
    end

    def your_department?
        department_ids = Array.new
        current_user.manager.departments.each do |department| 
            department_ids.append(department.id)
        end
        if department_ids.any? params[:department_id]
            flash[:notice] = "This department doesn't belong to you."
            redirect_to departments_path
        end
    end
end