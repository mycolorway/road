class AddSubtypeAndDescriptionToGeoPoints < ActiveRecord::Migration
  def up
    change_table :geo_points do |t|
      t.column :subtype, 'tinyint unsigned', null: false, default: 0
      t.text :description
    end
  end

  def down
    remove_column :geo_points, :subtype
    remove_column :geo_points, :description
  end
end
