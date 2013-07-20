class CreateGeoPoints < ActiveRecord::Migration
  def change
    create_table :geo_points do |t|
      t.string :sti_type, null: false, limit: 255

      t.decimal :latitude, null: false, index: true
      t.decimal :longitude, null: false, index: true
      t.decimal :elevation, null: false

      t.datetime :attributes_updated_at, null: false

      t.belongs_to :story, null: false, index: true
      t.belongs_to :creator

      t.timestamps
    end
    add_index :geo_points, :story_id
    add_index :geo_points, :creator_id
  end
end
