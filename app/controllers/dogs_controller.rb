class DogsController < ApplicationController
before_action :fetch_dogs, only: [:show, :edit, :update]
  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to dogs_path(@dog)
  end

  def edit
  end


  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  private

  def fetch_dogs
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed)

  end
end
