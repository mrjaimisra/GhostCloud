class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :login_from_session

  helper_method :current_user, :current_client

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_client
    @current_client ||= Soundcloud.new(:client_id => ENV["soundcloud_id"],
                                    :client_secret => ENV["soundcloud_secret"],
                                    :redirect_uri => "http://127.0.0.1:3000/auth/soundcloud/callback",
                                    :response_type => 'code')
  end

  def authorize!
    redirect_to root_path unless current_user
  end

  def login_as(user)
    @current_user = user
    session[:current_user_id] = user.try(:id)
  end

  def login_from_session
    @current_user = User.find_by_id(session[:current_user_id])
  end
end
