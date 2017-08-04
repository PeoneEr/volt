module SessionsHelper
  def sign_in(user)
    cookies[:token] = Digest::SHA1.hexdigest(user.email.to_s)
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    token = cookies[:token].to_s
    @current_user ||= User.find_by(token: token)
  end

  def sign_out
    cookies.delete(:token)
    self.current_user = nil
  end
end
