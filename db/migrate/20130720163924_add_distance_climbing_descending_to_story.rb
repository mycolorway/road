class AddDistanceClimbingDescendingToStory < ActiveRecord::Migration
  def up
    change_table :stories do |t|
      t.decimal :total_distance_km, precision: 10, scale: 2
      t.decimal :total_climbing_m, precision: 10, scale: 2
      t.decimal :total_descending_m, precision: 10, scale: 2
    end

    Story.find_each do |story|
      story.save
    end

    change_column :stories, :total_distance_km, :decimal, null: false
    change_column :stories, :total_climbing_m, :decimal, null: false
    change_column :stories, :total_descending_m, :decimal, null: false
  end

  def down
    remove_column :stories, :total_distance_km
    remove_column :stories, :total_climbing_m
    remove_column :stories, :total_descending_m
  end
end
