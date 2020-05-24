class ChangeDefaultForIcon < ActiveRecord::Migration[6.0]
  def change
    change_column :groups, :icon, :string, default: "https://via.placeholder.com/100x100"
  end
end
