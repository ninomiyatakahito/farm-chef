class PostsController < ApplicationController
  def index
  end

  private

  def post_params
    params.require(:post).permit(:post_text, :image).merge(user_id: current_user.id)
  end
end
