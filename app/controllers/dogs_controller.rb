class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def destroy
    Dog.find(params[:id]).destroy
    redirect_to dogs_path
  end



end
