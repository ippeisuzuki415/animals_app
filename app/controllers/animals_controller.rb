class AnimalsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @animal = Animal.new
    @animals = Animal.all
    @user = current_user
  end

  def show
  end

  def destroy
  end
end
