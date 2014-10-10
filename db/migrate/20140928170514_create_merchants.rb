class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.boolean :premium, default: false

      t.timestamps
    end
    add_index :merchants, :name
  end
end
