class User < ActiveRecord::Base
  def self.find_or_create_by_soundcloud_user_id(data)
    user = User.find_or_create_by(soundcloud_user_id: data[:soundcloud_user_id],
                                  soundcloud_username: data[:soundcloud_username])

    user.soundcloud_user_id  = data[:soundcloud_user_id]
    user.soundcloud_username = data[:soundcloud_username]

    # access_token = client.exchange_token(:code => params[:code])
    # @current_client ||= Soundcloud.new(:access_token => access_token["access_token"])
    user.save

    user
  end

  def self.soundcloud_client(options={})
    options = {
        :client_id     => ENV['soundcloud_id'],
        :client_secret => ENV['soundcloud_secret'],
    }.merge(options)

    Soundcloud.new(options)
  end

  def soundcloud_client(options={})
    options= {
        :expires_at    => soundcloud_expires_at,
        :access_token  => soundcloud_access_token,
        :refresh_token => soundcloud_refresh_token
    }.merge(options)

    client = self.class.soundcloud_client(options)

    # define a callback for successful token exchanges
    # this will make sure that new access_tokens are persisted once an existing
    # access_token expired and a new one was retrieved from the soundcloud api
    client.on_exchange_token do
      self.update_attributes!({
                                  :soundcloud_access_token  => client.access_token,
                                  :soundcloud_refresh_token => client.refresh_token,
                                  :soundcloud_expires_at    => client.expires_at,
                              })
    end

    client
  end
end
