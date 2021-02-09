class UsersController < ApplicationController

  def index
    @users = User.all

  end

  def show
    user = User.find(params[:id])
    @name = user.last_name
    @prefecture = user.prefecture
    @business_name = user.business_name
    @profile = user.profile

    @user = User.find(params[:id])

  end

end

