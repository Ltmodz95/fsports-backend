class Component < ApplicationRecord
  belongs_to :product
  has_many :options, dependent: :destroy
  validates_presence_of :name
  accepts_nested_attributes_for :options, allow_destroy: true
end
