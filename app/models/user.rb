class User < ApplicationRecord
    has_many :sessions, foreign_key: :author_id, dependent: :destroy
    has_many :groups
end
