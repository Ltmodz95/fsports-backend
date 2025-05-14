class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_one :cart, dependent: :destroy
  after_create :create_cart

  enum role: [:admin, :user]

  private
    def create_cart
      
      Cart.create!(user: self)
    end
end
