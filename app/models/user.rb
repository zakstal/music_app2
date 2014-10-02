

class User < ActiveRecord::Base

  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.try(:is_password?) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(unencrypeted_password)
    return unless unencrypeted_password.present?
      @password = unencrypeted_password
      self.password_digest = BCrypt::Password.create(@password)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end



end