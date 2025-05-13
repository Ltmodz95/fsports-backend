class Option < ApplicationRecord
  belongs_to :component
  has_many :incompatablity_rules, foreign_key: :second_option_id
  validates_presence_of :name, :price, :in_stock
  validates_numericality_of :price, greater_than: 0
  validates_inclusion_of :in_stock, in: [true, false]
end
