class SoundcloudService

  def me
  end



  def favorites
    @me = current_user.soundcloud_client.get("/me/favorites")
  end

  private

    def parse(response)
      JSON.parse(response.body)
    end
end