class Group < ApplicationRecord
    has_many :groupings
    has_many :sessions, through: :groupings, dependent: :nullify
end
