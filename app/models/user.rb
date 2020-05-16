class User < ApplicationRecord
  has_many :sessions, foreign_key: :author_id, dependent: :destroy
  has_many :groups, through: :sessions

  def to_param
    username
  end

  def my_sessions
    sessions.select { |s| s.groups.any?}
  end

  def my_sessions_total
    sessions.select('session.id, group.id').joins(:groups).sum(:amount)
  end

  def ext_sessions
    sessions.select { |s| !s.groups.any? }
  end

  def ext_sessions_total
    sessions.left_outer_joins(:groupings).where(groupings: {session_id: nil}).sum(:amount)
  end
end
