class Component < ApplicationRecord
  belongs_to :product
  validates_presence_of :name
end
