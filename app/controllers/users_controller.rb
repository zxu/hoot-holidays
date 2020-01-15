class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def map
    @users = User.select(:name, :latitude, :longitude) # all rows, certain columns
  end
end
