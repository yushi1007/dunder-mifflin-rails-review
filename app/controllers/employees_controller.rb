class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def create
        employee_params = params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
        @employee = Employee.new(employee_params)
        if @employee.valid?
          @employee.save
          redirect_to employee_path(@employee)
        else
        flash[:errors] = @employee.errors.full_messages
        render :new
        end
    end

    def edit 
        @employee = Employee.find(params[:id])
    end
    
    def update
        @employee = Employee.find(params[:id])
        employee_params = params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:errors] = @employee.errors.full_messages
            render :edit
        end 
    end

end
