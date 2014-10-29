class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :item
      t.text :description
      t.string :kind
      t.string :price
      t.belongs_to :merchant, index: true

      t.timestamps
    end
  end
end
