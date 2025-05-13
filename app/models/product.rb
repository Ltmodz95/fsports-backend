class Product < ApplicationRecord
  belongs_to :category
  has_many :componenets
  validates_presence_of :name, :base_price, :description, :category
end
