class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  enum :role, [:user, :admin]

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_one :cart, dependent: :destroy
  after_create :create_cart



  private
    def create_cart
      
      Cart.create!(user: self)
    end
end
