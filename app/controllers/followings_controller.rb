class FollowingsController < ApplicationController
  def index
    @followings = current_user.soundcloud_client.get("/me/followings")
  end

  def delete
    unfollow(id)
  end

  def unfollow
    current_user.soundcloud_client.delete("/me/followings/#{params[:id].to_i}")
    redirect_to following_path
  end
end