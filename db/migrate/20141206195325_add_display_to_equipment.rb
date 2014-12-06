class AddDisplayToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :display, :boolean, default: true
  end
end
