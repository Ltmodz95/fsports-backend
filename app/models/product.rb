class Product < ApplicationRecord
  belongs_to :category
  has_many :components, dependent: :destroy
  has_many :options, through: :components, dependent: :destroy
  has_many :price_adjustments, dependent: :destroy
  has_many :incompatablity_rules, dependent: :destroy

  
  validates_presence_of :name, :base_price, :description, :category
  accepts_nested_attributes_for :components, allow_destroy: true
  accepts_nested_attributes_for :price_adjustments, allow_destroy: true
  accepts_nested_attributes_for :incompatablity_rules, allow_destroy: true

  default_scope { where(in_stock: true) }
end
