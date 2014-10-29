class CreateConcentrates < ActiveRecord::Migration
  def change
    create_table :concentrates do |t|
      t.string :strain
      t.string :fees
      t.string :kind
      t.string :quantity_price
      t.belongs_to :merchant

      t.timestamps
    end
    add_index :concentrates, :strain
  end
end
