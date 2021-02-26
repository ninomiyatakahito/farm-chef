class FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:follow_id])
  end
end
