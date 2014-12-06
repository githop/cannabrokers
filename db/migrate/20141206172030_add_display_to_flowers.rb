class AddDisplayToFlowers < ActiveRecord::Migration
  def change
    add_column :flowers, :display, :boolean, default: true
  end
end
