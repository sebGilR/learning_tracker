class Group < ApplicationRecord
  has_many :groupings
  has_many :sessions, through: :groupings, dependent: :nullify
  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z\s]+\z/,
                                                                message: 'only allows letters and spaces' }

  def to_param
    name
  end
end
