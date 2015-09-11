OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development? || Rails.env.production?

Rails.application.config.middleware.use OmniAuth::Builder do
  provider "soundcloud", ENV['soundcloud_id'], ENV['soundcloud_secret']
end
