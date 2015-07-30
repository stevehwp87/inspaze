class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :date_of_birth
      t.string :gender
      t.integer :phone_no

      t.string :company_name
      t.text :location
      t.string :years_in_business
      t.string :profession
      t.string :name_to_show
      t.string :email_to_show
      t.integer :contact_to_show
      t.string :website
      t.string :business_description

      t.timestamps null: false
    end
  end
end
