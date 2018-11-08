class EmployeesController < ApplicationController
  before_action :fetch_employees, only: [:show, :edit, :update]
    def index
      @employees = Employee.all
    end

    def show
      @employee_dog = Employee.find(params[:id]).dog_id
      @dog = Dog.find(@employee_dog).name
    end

    def new
      @employee = Employee.new
    end

    def create
      @employee = Employee.create(employee_params(:first_name, :last_name, :alias,:title,:office,:img_url))
      redirect_to employees_path(@employee)
    end

    def edit
    end


    def update
      @employee.update(employee_params(:alias,:title,:office, :img_url))
      redirect_to employee_path(@employee)
    end

    private

    def fetch_employees
      @employee = Employee.find(params[:id])
    end

    def employee_params(*args)
      params.require(:employee).permit(*args)

    end
end
