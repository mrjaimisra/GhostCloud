class DashboardController < ApplicationController
  def show
    @tracks = current_user.soundcloud_client.get("/me/tracks", :limit => 10)
    @me     = current_user.soundcloud_client.get("/me")
  end
end