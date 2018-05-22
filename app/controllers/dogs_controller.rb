class DogsController < ApplicationController
  before_action :set_dog, except: [:new, :index, :create]

  def index
    @dogs = policy_scope(Dog).order(created_at: :desc)
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create

    @dog = Dog.new(dog_params)
        authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render "new"
    end
  end

  def edit
    authorize @dog
  end

  def update
    authorize @dog
    @dog.update(dog_params)
      if @dog.save
      redirect_to dogs_path
    else
      render "edit"
    end
  end

  def destroy
    authorize @dog
    @dog.delete
  end

  def show
  authorize @dog
  end

  private
  def set_dog
     @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :breed, :gender, :photo, :size, :price)
  end

end
