class ChangeDefaultImage < ActiveRecord::Migration[6.0]
  def change
    change_column :groups, :icon, :string, default: "https://placeimg.com/50/50/tech"
  end
end
