module Api
  class SignIn
    include ActiveModel::Validations

    attr_reader :email, :password, :name, :device, :device_token, :session

    validate :user_presence

    validate :user_password

    delegate :decorate, to: :session, prefix: nil

    def initialize(params = {})
      @email = params[:email]
      @password = params[:password]
      @name = params[:name]
      @device = params[:device]
      @device_token = params[:device_token]
    end

    def save!
      raise ActiveModel::StrictValidationFailed unless valid?

      # TODO: add this
      # PushNotifications::NewSignIn.new(device, device_token, user.notifications_count).execute!

      create_session!
    end

    private

    def user
      @user ||= User.where('LOWER(email) = LOWER(?)', email).first
    end

    def user_presence
      errors.add(:base, 'Email and/or password is invalid') unless user
    end

    def user_password
      return unless user

      errors.add(:base, 'Email and/or password is invalid') unless user.authenticate(password)
    end

    def create_session!
      @session ||= user.sessions.create!(name: name, device: device, device_token: device_token)
    end
  end
end
