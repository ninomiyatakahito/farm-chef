class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = user.last_name
    @profile = user.profile
    @prefecture = user.prefecture
    @business_name = user.business_name
    @profile = user.profile
  end

end
