class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :date_of_birth
      t.string :gender
      t.string :state
      t.integer :phone_no

      t.timestamps null: false
    end
  end
end