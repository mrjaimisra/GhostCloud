class SoundcloudController < ApplicationController
  def connect
    redirect_to soundcloud_client.authorize_url
  end

  def connected
    soundcloud_client.exchange_token(:code => params[:code])
    me = soundcloud_client.get("/me")

    login_as User.find_or_create_by_soundcloud_user_id({
                                                           :soundcloud_user_id  => me.id,
                                                           :soundcloud_username => me.username
                                                       })
    session[:user_id] = User.last.id

    current_user.update_attributes!({
                                        :soundcloud_access_token  => soundcloud_client.access_token,
                                        :soundcloud_refresh_token => soundcloud_client.refresh_token,
                                        :soundcloud_expires_at    => soundcloud_client.expires_at,
                                    })
  redirect_to dashboard_path
  end

  def destroy
  end

  private

    def soundcloud_client
      return @soundcloud_client if @soundcloud_client
      @soundcloud_client = User.soundcloud_client(:redirect_uri  => soundcloud_connected_url)
    end
end
