class FollowingsController < ApplicationController
  def index
    @followings = current_user.soundcloud_client.get("/me/followings")
  end
end