class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.column :subtype, 'tinyint unsigned', null: false
      t.string :title, null: false, limit: 255
      t.text :content
      t.decimal :total_distance_km, precision: 10, scale: 2, null: false, default: 0
      t.decimal :total_climbing_m, precision: 10, scale: 2, null: false, default: 0
      t.decimal :total_descending_m, precision: 10, scale: 2, null: false, default: 0
      t.decimal :difficulty_index, precision: 10, scale: 2, null: false, default: 0
      t.belongs_to :creator, null: false

      t.timestamps
    end
    add_index :stories, :creator_id
  end
end
