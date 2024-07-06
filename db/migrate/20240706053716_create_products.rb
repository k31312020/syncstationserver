class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :stock
      t.text :description
      t.string :short
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :code, unique: true
  end
end
