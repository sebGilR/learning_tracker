class Session < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings
  validates :name, presence: true, length: { maximum: 10 }
  validates :amount, presence: true

  def group
    groups.first
  end

  def group=(group)
    g = Group.find_by(name: group)
    if g
      self.groups << g
    end
  end
end
