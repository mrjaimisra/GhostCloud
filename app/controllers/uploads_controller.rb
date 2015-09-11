class UploadsController < ApplicationController
  def index
    @uploads = current_user.soundcloud_client.get("/me/tracks")
  end
end