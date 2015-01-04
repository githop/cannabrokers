class AddRecMedToConcentrates < ActiveRecord::Migration
  def change
    add_column :concentrates, :rec_med, :string
  end
end
