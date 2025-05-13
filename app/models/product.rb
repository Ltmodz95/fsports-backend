class Product < ApplicationRecord
  belongs_to :category
  has_many :components
  validates_presence_of :name, :base_price, :description, :category


  default_scope { where(in_stock: true) }
end
