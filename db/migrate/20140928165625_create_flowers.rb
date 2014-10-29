class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.string :strain
      t.string :kind
      t.text :description
      t.string :quantity_price
      t.belongs_to :merchant

      t.timestamps
    end
    add_index :flowers, :strain
  end
end
