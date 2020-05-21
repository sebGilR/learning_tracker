class User < ApplicationRecord
  has_many :sessions, foreign_key: :author_id, dependent: :destroy
  has_many :groups, through: :sessions
  validates :name, presence: true, length: { in: 2..25 }, format: { with: /\A[a-zA-Z]+\z/,
                                                                    message: 'only allows letters' }
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' },
                       length: { in: 2..10 }, uniqueness: true

  def to_param
    username
  end

  def recent
    sessions.limit(5)
  end

  def recent_total
    sessions.limit(5).sum(:amount)
  end

  def my_sessions
    sessions.includes(:groups).select { |s| s.groups.any? }
  end

  def my_sessions_total
    sessions.select('session.id, group.id').joins(:groups).sum(:amount)
  end

  def ext_sessions
    sessions.includes(:groups).reject { |s| s.groups.any? }
  end

  def ext_sessions_total
    sessions.left_outer_joins(:groupings).where(groupings: { session_id: nil }).sum(:amount)
  end
end
