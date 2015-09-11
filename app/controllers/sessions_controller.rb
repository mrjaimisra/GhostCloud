class SessionsController < ApplicationController
#   # def create
#   #   user = User.find_or_create_from_auth(data)
#   #
#   #   if user
#   #     session[:user_id] = user.id
#   #     redirect_to dashboard_path
#   #   else
#   #     redirect_to root_url
#   #   end
#
#     # # make an authenticated call
#     # soundcloud_user = client.get('/me')
#     # unless User.where(:soundcloud_user_id => soundcloud_user["id"]).present?
#     #   User.create_from_soundcloud(soundcloud_user, access_token)
#     # end
#     # sign_in_user = User.where(:soundcloud_user_id => soundcloud_user["id"])
#     #
#     # #create user sessions
#     # session[:user_id] = sign_in_user.first.id
#     # redirect_to dashboard_path, notice: "Signed in!"
#   end
#
#   private
#
    def data
      binding.pry
      request.env['omniauth.auth']
    end
end
