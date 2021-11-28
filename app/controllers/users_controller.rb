class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @animals = @user.animals
    @animal = Animal.new
  end

  def edit
    @user = User.find(params[:id])
   if @user != current_user
    redirect_to user_path(current_user)
   end
  end


  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:success] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
   else
     render :edit
   end
  end

  def index
     @animal = Animal.new
     @user = User.new
     @users = User.all
     @user = current_user

  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :profile_image, :introduction)
  end

end
