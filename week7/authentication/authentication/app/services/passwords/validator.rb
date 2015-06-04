module Passwords
  class Validator
    class << self
      def for(user, new_password)
        new(user, new_password)
      end
    end

    def initialize(user, new_password)
      @user = user
      @new_password = salt + new_password
    end

    def valid?
      calculate_password == @new_password
    end

    private

    def calculate_password
      @calculated_pass ||= BCrypt::Password.new(@user.password_hash)
    end

    def salt
      @user.salt + Consts::PEPPER
    end
  end
end