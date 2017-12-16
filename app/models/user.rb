class User < ActiveRecord::Base
  has_secure_password

  has_many :songs
  has_many :adds
  has_many :songs_added, through: :adds, source: :song

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  # validates :city, presence: true
  # validates :state, presence: true, length: { is: 2 }

  # only validate password on creation, otherwise will give error on update
  # validates :password, length: { minimum: 8 }, on: :create
  
  before_save :setCase

  def setCase
    # first_name.downcase!
    # last_name.downcase!
    email.downcase!
  end
end
