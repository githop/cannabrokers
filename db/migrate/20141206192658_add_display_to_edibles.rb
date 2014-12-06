class AddDisplayToEdibles < ActiveRecord::Migration
  def change
    add_column :edibles, :display, :boolean, default: true
  end
end
