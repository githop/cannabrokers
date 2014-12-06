class AddDisplayToConcentrates < ActiveRecord::Migration
  def change
    add_column :concentrates, :display, :boolean, default: true
  end
end
