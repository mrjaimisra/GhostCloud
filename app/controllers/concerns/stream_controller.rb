class StreamController < ApplicationController
  def index
    @activities = current_user.soundcloud_client.get("/me/activities/tracks/affiliated")
  end

  def search
    @search = current_user.soundcloud_client.get('/tracks', :q => params[:q], :licence => 'cc-by-sa')
  end

end