class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :designer_id, null: false
      t.timestamps null: false
    end
  end
end
