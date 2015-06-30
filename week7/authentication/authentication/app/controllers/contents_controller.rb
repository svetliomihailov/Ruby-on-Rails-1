class ContentsController < ApplicationController
  before_filter :required_login

  def index
    @user = current_user
  end
end