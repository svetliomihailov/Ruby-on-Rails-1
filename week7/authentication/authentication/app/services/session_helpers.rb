module SessionHelpers
  def login(user_id)
    session[:current_user_id] = user_id
  end

  def logout
    session[:current_user_id] = nil
  end

  def user_logged_in?
    session[:current_user_id].present?
  end
end