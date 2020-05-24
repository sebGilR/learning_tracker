class CreateGroupings < ActiveRecord::Migration[6.0]
  def change
    create_table :groupings do |t|
      t.integer :session_id, index: true
      t.integer :group_id, index: true

      t.timestamps
    end
  end
end
