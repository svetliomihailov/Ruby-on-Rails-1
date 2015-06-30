class RegistrationsController < ApplicationController
  def new
    @registration = RegistrationForm.new
  end

  def create
    @registration = RegistrationForm.new params[:registration_form]

    if @registration.save
      render text: 'You sir have a user!'
    else
      render text: @registration.errors.full_messages
    end
  end
end