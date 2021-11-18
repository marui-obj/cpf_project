class ShiftsController < ApplicationController

    def new
        @shift = Shift.new
    end

    def show
        id = params[:id]
        @shift = Shift.find(id)
        @employee_info = Array.new
        @employee_status = Array.new
        @employee_worktime = Array.new
        @shift.department.employees.each do |employee|
            @temp_worktime = 0
            @temp_employee_info = Hash.new
            @temp_employee_info[:id] = employee.id
            @temp_employee_info[:name] = employee.name
            unless employee.shifts.size == 0
                employee.shifts.each do |shift|
                    # Check Employee Status
                    if overlap?(shift, @shift)
                        @temp_employee_info[:status] = 'Occupied'
                    else
                        if @temp_employee_info[:status] == '' or @temp_employee_info[:status].nil?
                            @temp_employee_info[:status] = 'Free'
                        end
                    end
                                
                    # Calculate Employee Worktime
                    if same_date?(shift, @shift)
                        @shift_worktime = (shift.check_out - shift.check_in)/3600
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
        end
        redirect_to department_shift_path(@department_id, @id)
    end

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
        @amount = params[:amount]
        if params[:manage_ot] == "Increase"
            # employee_ids.each do |employee_id|
            #     employee = Employee.find(employee_id)
            #     employee.shifts.find(@id).update
            @shift.overtime += @amount.to_f
        elsif params[:manage_ot] == "Decrease"
            @shift.overtime -= @amount.to_f
        end
        @shift.update(:overtime=>@shift.overtime)
        @shift.employees.each do |employee|
            employee.save
        end
    end

    def assign_employee
        assign_key = eval(params.to_s).invert["Assign"].sub(/assign_/,"").to_i
        employee_id = params["employee_id_#{assign_key}".to_sym]
        employee = Employee.find(employee_id)
        unless @shift.employees.include?(employee)
            @shift.employees.append(employee)
            employee.save
        end
    end

    def remove_employee
        remove_key = eval(params.to_s).invert["Remove"].sub(/remove_/,"").to_i
        employee_id = params["cur_employee_id_#{remove_key}".to_sym]
        employee = Employee.find(employee_id)
        employees = Array.new
        @shift.employees.each do |target|
            if target.id != employee.id
                employees.append(target)
            end
        end
        @shift.employees = employees
        @shift.save
    end
end