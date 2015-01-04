class AddRecMedToEdibles < ActiveRecord::Migration
  def change
    add_column :edibles, :rec_med, :string
  end
end
