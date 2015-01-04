class AddRecMedToFlowers < ActiveRecord::Migration
  def change
  	add_column :flowers, :rec_med, :string
  end
end
