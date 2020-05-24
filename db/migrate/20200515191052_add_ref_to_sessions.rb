class AddRefToSessions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :sessions, :users, column: "author_id"
  end
end
