class SignInForm
  include ActiveModel::Model

  attr_accessor :password, :email, :remember_me, :user

  validates :email, presence: true
  validates :password, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def signed_in?
    return false unless valid?

    valid_password_email_pair?
  end

  def signed_in_user_id
    @user.id if @user.present?
  end

  private

  def valid_password_email_pair?
    @user = User.find_by email: email

    if @user.present?
      Passwords::Validator.for(@user, password).valid?
    else
      false
    end
  end
end