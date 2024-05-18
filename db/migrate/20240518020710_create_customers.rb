class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :firstname
      t.text :middlename, :null => true
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
