class Group < ApplicationRecord
  has_many :groupings
  has_many :sessions, through: :groupings, dependent: :nullify
  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end
end
