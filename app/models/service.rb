class Service < ApplicationRecord
  has_many :service_mappers
  belongs_to :category
  validates :name, presence: true
end
