class Component < ApplicationRecord
  belongs_to :product
  has_many :options
  validates_presence_of :name
end
