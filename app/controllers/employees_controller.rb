class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    set_employee
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)
    @dogs = Dog.all
    if @employee.save
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    set_employee
    @dogs = Dog.all
  end

  def update
    set_employee
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    set_employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
  end

end
