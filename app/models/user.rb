class User < ApplicationRecord
  attr_accessor :password

  enum role: [ :student, :admin ]

  before_save :encrypt_password
  after_save :clear_password

  has_many :course_students, foreign_key: :student_id
  has_many :courses, through: :course_students

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # validates :password, confirmation: true

  def encrypt_password
  	if password.present?
  		self.salt = BCrypt::Engine.generate_salt
  		self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  	end
  end

  def clear_password
  	self.password = nil
  end

  def self.authenticate(username_or_email = "", login_password = "")
    return unless username_or_email || login_password
    user = User.where(email: username_or_email).first
    user = User.where(username: username_or_email).first unless user

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
