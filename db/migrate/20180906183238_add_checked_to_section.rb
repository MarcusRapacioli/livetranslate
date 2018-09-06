class AddCheckedToSection < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :checked, :boolean, default: false
  end
end
