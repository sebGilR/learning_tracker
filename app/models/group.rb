class Group < ApplicationRecord
  has_many :groupings
  has_many :sessions, through: :groupings, dependent: :nullify

  def to_param
    name
  end
end
