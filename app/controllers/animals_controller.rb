class AnimalsController < ApplicationController

  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id
   if @animal.save
     flash[:success] = 'You have created animal successfully.'
     redirect_to animals_path(@animal)
   else
     @animals = Animal.all
     @user = current_user
     render :index
   end
  end

  def index
    @animal = Animal.new
    @animals = Animal.all
    @user = current_user
  end

  def show
     @animals = Animal.new
     @animal = Animal.find(params[:id])
     @user = @animal.user
  end

  def edit
     @animal = Animal.find(params[:id])
   if @animal.user == current_user
      render :edit
   else
      redirect_to animals_path
   end
  end

  def update
     @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
     flash[:success] = 'You have updated animal successfully.'
     redirect_to animal_path(@animal.id)
    else
     render :edit
    end
  end

  def destroy
     @animal = Animal.find(params[:id])
     @animal.destroy
     redirect_to animals_path
  end

  private

  def animal_params
  params.require(:animal).permit(:title, :body)
  end

end
