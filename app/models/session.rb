class Session < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings

  def group
    groups.first
  end
end
