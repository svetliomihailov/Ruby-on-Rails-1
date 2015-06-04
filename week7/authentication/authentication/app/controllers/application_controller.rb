class ApplicationController < ActionController::Base
  include SessionHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_login
    unless user_logged_in?
      redirect_to sessions_url
    end
  end
end
