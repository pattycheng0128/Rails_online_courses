class User < ApplicationRecord
  validates :email, :username, presence: true

  # after_save :add_carts
  after_create :create_carts
  has_many :courses
  has_many :carts
  has_many :orders

  before_create :encryted_password

  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}zz"
    encryted_password = Digest::SHA2.hexdigest(salted_password)

    self.find_by(email: email, password: encryted_password)
  end

  def create_carts
    if carts.blank?
      Cart.buy_now.create(user: self)
      Cart.buy_next_time.create(user: self)
    end
  end

  def buy_now_cart
    carts.buy_now.first
  end

  def buy_now_cart_items
    buy_now_cart.cart_items
  end

  private
  def encryted_password
    salted_password = "xy#{password.reverse}zz"
    self.password = Digest::SHA2.hexdigest(salted_password)
  end

end
