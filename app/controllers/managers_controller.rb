class ManagersController < ApplicationController

    def new
        @manager = Manager.new
    end

    def create
        @manager = Manager.new(manager_params)
        if @manager.save
            continue
        else
            render :new
        end
    end

    private

    def manager_params
        params.require(:manager).permit(:name)
    end

end