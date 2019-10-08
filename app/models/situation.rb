class Situation < ApplicationRecord
  belongs_to :sector
  belongs_to :problem

  enum status: {active: 0, inactive: 1, in_progress: 2}

  validates :status, presence: true
end
