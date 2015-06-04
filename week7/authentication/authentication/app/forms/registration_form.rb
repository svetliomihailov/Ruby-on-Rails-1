class RegistrationForm
  include ActiveModel::Model

  attr_accessor(
    :first_name,
    :last_name,
    :email,
    :password,
    :confirm_password
  )

  validates :email, presence: true
  validates :password, presence: true
  validates :confirm_password, presence: true
  validates_confirmation_of :password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validate :unique_email

  def save
    create_user if valid?
  end

  private

  def create_user
    u = User.new
    u.first_name = first_name
    u.last_name = last_name
    u.email = email
    u.registered_on = Time.current

    pc = Passwords::Creator.for password

    u.password_hash = pc.password_hash
    u.salt = pc.salt
    u.save
  end

  def unique_email
    if User.find_by(email: email).present?
      errors.add(:email, 'is not unique')
    end
  end
end