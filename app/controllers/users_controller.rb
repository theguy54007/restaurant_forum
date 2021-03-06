class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def index
    @users = User.all
  end

  def show
    @commented_restaurants = @user.restaurants.uniq
    @followers = @user.followers
    @favorited_restaurants = @user.favorited_restaurants
    @followings = @user.followings
    @friends = @user.friends
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end






  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end




end
