class SessionsController < ApplicationController
  def index
    @sign_in = SignInForm.new
  end

  def sign_in
    @sign_in = SignInForm.new params[:sign_in_form]

    if @sign_in.signed_in?
      login @sign_in.signed_in_user_id
      redirect_to contents_path
    else
      redirect_to sessions_path
    end
  end

  def logout
    logout
    redirect_to sessions_path
  end
end