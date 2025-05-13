class Product < ApplicationRecord
  belongs_to :category
  validates_presence_of :name, :base_price, :description, :category
end
