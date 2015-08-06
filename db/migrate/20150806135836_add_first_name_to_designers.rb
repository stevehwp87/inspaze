class AddFirstNameToDesigners < ActiveRecord::Migration
  def change
  add_column :designers, :first_name, :string
  add_column :designers, :last_name, :string
  add_column :designers, :date_of_birth, :string
  add_column :designers, :gender, :string
  add_column :designers, :phone_no, :integer
  add_column :designers, :company_name, :string
  add_column :designers, :address, :string
  add_column :designers, :country, :string
  add_column :designers, :years_in_business, :integer
  add_column :designers, :profession, :string
  add_column :designers, :position, :string
  add_column :designers, :display_name, :string
  add_column :designers, :display_email, :string
  add_column :designers, :display_contact, :string
  add_column :designers, :website, :string
  add_column :designers, :business_description, :string
  end
end
