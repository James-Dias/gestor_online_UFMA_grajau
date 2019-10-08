class Problem < ApplicationRecord
  has_many :situations
  has_many :sectors, through: :situations

  accepts_nested_attributes_for :situations, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
