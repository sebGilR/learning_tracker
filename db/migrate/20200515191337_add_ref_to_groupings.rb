class AddRefToGroupings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :groupings, :sessions
    add_foreign_key :groupings, :groups
    add_index :sessions, :author_id
  end
end
