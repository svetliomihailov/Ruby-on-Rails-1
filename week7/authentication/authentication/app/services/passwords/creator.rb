module Passwords
  class Creator
    class << self
      def for(plain_text)
        new plain_text
      end
    end

    def initialize(plain_text_password)
      @plain_password = plain_text_password
    end

    def salt
      return @salt if @salt.present?

      create_password
      @salt
    end

    def password_hash
      return @password_hash if @password_hash.present?

      create_password
      @password_hash
    end

    private

    def create_password
      prepare_salt

      @password_hash = BCrypt::Password.create(
        calculate_salt + @plain_password,
        cost: Consts::BCRYPT_COST
      )
    end

    def prepare_salt
      @salt = BCrypt::Engine.generate_salt
    end

    def calculate_salt
      @salt + Consts::PEPPER
    end
  end
end

