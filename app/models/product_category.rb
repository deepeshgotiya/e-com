class ProductCategory < ApplicationRecord
  belongs_to :admin
  has_many :products

  validates :name, presence: true
end
