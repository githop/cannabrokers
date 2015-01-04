class AddRecMedToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :rec_med, :string
  end
end
