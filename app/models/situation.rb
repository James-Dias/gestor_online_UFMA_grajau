class Situation < ApplicationRecord
  belongs_to :sector
  belongs_to :problem

  enum status: {active: 0, inactive: 1, in_progress: 2}

  validates :status, presence: true

  scope :problem_query, lambda { |query|
    joins(:problem).where("problems.name ILIKE ?", "#{query}")
  }

  scope :sector_query, lambda { |query|
    joins(:sector).where("sectors.name ILIKE ?", "#{query}")
  }

  scope :status_query, lambda {|status|
    where(status: status)
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^problem_name/
      joins(:problem).order("LOWER(problems.name) #{ direction }")
    when /^sector_name/
      joins(:sector).order("LOWER(sectors.name) #{ direction }")
    when /^created_at/
      order("situations.created_at #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  filterrific(
    available_filters: [
      :problem_query,
      :sector_query,
      :status_query,
      :sorted_by
    ]
  )

  def self.options_for_sorted_by
    [
      ['Problema (Crescente)', 'problem_name_asc'],
      ['Setor (Crescente)', 'sector_name_asc'],
      ['Data de Criação (Decrescente)', 'created_at_desc'],
    ]
  end
end
