class ChangeDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column :groups, :icon, :string, default: "https://via.placeholder.com/50x50"
  end
end
