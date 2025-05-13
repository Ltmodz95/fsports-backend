class Product < ApplicationRecord
  belongs_to :category
  has_many :components
  has_many :options, through: :components
  validates_presence_of :name, :base_price, :description, :category


  default_scope { where(in_stock: true) }
end
