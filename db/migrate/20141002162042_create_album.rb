class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :session, null: false
      t.integer :band_id, null: false

      t.timestamps
    end

    add_index :albums, :band_id
  end
end
