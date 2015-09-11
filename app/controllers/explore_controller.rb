class ExploreController < ApplicationController
  def index
    @tracks = current_user.soundcloud_client.get("/tracks")
  end
end