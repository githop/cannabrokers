class CreateEdibles < ActiveRecord::Migration
  def change
    create_table :edibles do |t|
      t.string :name
      t.text :description
      t.string :price

      t.timestamps
    end
    add_index :edibles, :name
  end
end
