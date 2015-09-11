class LikesController < ApplicationController
  def index
    @likes = current_user.soundcloud_client.get("/me/favorites")
  end
end