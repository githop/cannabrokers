class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to :flower, index: true
      t.belongs_to :concentrate, index: true
      t.belongs_to :edible, index: true
      t.belongs_to :merchant, index: true

      t.timestamps
    end
  end
end
