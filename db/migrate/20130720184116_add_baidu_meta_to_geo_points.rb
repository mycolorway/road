class AddBaiduMetaToGeoPoints < ActiveRecord::Migration
  def up
    change_table :geo_points do |t|
      t.integer :baidu_id, index: true
      t.decimal :baidu_lat, precision: 10, scale: 6
      t.decimal :baidu_lng, precision: 10, scale: 6
    end
  end

  def down
    remove_column :geo_points, :baidu_id
    remove_column :geo_points, :baidu_lat
    remove_column :geo_points, :baidu_lng
  end
end
