class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :text
    add_column :users, :gender, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :phone_no, :integer
  end
end
