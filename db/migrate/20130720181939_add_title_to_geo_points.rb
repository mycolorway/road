class AddTitleToGeoPoints < ActiveRecord::Migration
  def up
    change_table :geo_points do |t|
      t.string :title, null: false, default: ''
    end
  end

  def down
    remove_column :geo_points, :title
  end
end
