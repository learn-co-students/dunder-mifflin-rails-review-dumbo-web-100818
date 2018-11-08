class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    show_dog
  end

  private

  def show_dog
    @dog = Dog.find(params[:id])
  end
end
