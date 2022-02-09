class User < ApplicationRecord
  validates :email, :username, presence: true

  has_many :courses

  before_create :encryted_password

  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}zz"
    encryted_password = Digest::SHA2.hexdigest(salted_password)

    self.find_by(email: email, password: encryted_password)
  end

  private
  def encryted_password
    salted_password = "xy#{password.reverse}zz"
    self.password = Digest::SHA2.hexdigest(salted_password)
  end

end
