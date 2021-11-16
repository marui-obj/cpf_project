class ShiftsController < ApplicationController

    def new
        @shift = Shift.new
    end

    def create
        @shift = Shift.new(shift_params)
        if @shift.save
            continue
        else
            render :new
        end
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
            @temp_employee_info[:name] = employee.name
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
            @temp_employee_info[:worktime] = @temp_worktime
            @employee_info.append(@temp_employee_info)
        end
    end

    def update
        @id = params[:id]
        @shift = Shift.find(@id)
        @amount = params[:amount]
        # redirect_to :root
        if params.key?("increase")
            print "hello"
            flash[:notice] = "hello"
            @shift.overtime += @amount.to_f
        elsif params.key?("decrease")
            @shift.overtime -= @amount.to_f
        end
        @shift.update(:overtime=>@shift.overtime)
        @shift.employees.each do |employee|
            employee.save
        end
        redirect_to department_shift_path(params[:department_id], @id)
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

end