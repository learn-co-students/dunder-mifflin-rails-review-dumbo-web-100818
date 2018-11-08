class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    show_employee
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)
    @dogs = Dog.all
    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    show_employee

  end

  def update
    show_employee

    @employee.update(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render :edit
    end
  end

    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to employees_path
    end


  private

  def show_employee
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end
end
