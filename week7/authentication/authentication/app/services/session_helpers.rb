module SessionHelpers
  def user_login(user_id)
    session[:current_user_id] = user_id
  end

  def user_logout
    session[:current_user_id] = nil
    forget_user
  end

  def user_logged_in?
    unless session[:current_user_id].present?
      session[:current_user_id] = cookies.signed[:user_id]
    end

    session[:current_user_id].present?
  end

  def current_user
    User.find session[:current_user_id]
  end

  def remember_user(user_id)
    cookies.signed[:user_id] = {value: user_id, expires: 1.hour.from_now}
  end

  def forget_user
    cookies.delete :user_id
  end
end