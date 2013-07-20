class CreateGeoPoints < ActiveRecord::Migration
  def change
    create_table :geo_points do |t|
      t.string :sti_type, null: false, limit: 255

      t.decimal :latitude, null: false, index: true, precision: 10, scale: 6
      t.decimal :longitude, null: false, index: true, precision: 10, scale: 6
      t.decimal :elevation, null: false, precision: 10, scale: 2

      t.datetime :attributes_updated_at, null: false

      t.belongs_to :story, null: false, index: true
      t.belongs_to :creator

      t.column :subtype, 'tinyint unsigned', null: false, default: 0
      t.string :title, null: false, default: ''
      t.text :description

      t.integer :baidu_id, index: true
      t.decimal :baidu_lat, precision: 10, scale: 6
      t.decimal :baidu_lng, precision: 10, scale: 6

      t.timestamps
    end
    add_index :geo_points, :story_id
    add_index :geo_points, :creator_id
  end
end
