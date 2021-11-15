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

    private

    def shift_params
        params.require(:shift).permit(:department)
    end
end