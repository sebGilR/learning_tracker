class Session < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings
  validates :name, presence: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z\s]+\z/,
                                                                      message: 'only allows letters and spaces' }
  validates :amount, presence: true, numericality: { only_integer: true }

  def group
    groups.first
  end

  def group=(group)
    g = Group.find_by(name: group)
    groups << g if g
  end
end
