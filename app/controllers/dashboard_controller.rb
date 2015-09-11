class DashboardController < ApplicationController
  def show
    @tracks = current_user.soundcloud_client.get("/me/uploads", :limit => 5)
    @me     = current_user.soundcloud_client.get("/me")
  end
end