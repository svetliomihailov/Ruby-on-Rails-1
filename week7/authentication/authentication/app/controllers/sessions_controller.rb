class SessionsController < ApplicationController
  def index
    @sign_in = SignInForm.new
  end

  def sign_in
    @sign_in = SignInForm.new params[:sign_in_form]

    if @sign_in.signed_in?
      user_login @sign_in.signed_in_user_id
      if @sign_in.remember_me == '1'
        remember_user @sign_in.user.id
      else
        forget_user
      end

      redirect_to root_path
    else
      redirect_to sessions_path
    end
  end

  def logout
    user_logout
    redirect_to sessions_path
  end
end