class Group < ApplicationRecord
    belongs_to :user
    has_many :groupings
    has_many :sessions, through: :groupings, dependent: :nullify
end
