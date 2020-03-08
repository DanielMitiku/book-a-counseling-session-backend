class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user_info = { user_id: user.id, is_privileged: user.is_privileged }
    JsonWebToken.encode(user_info) if user
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)
    return user if user&.authenticate(password)

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
