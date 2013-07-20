class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title, null: false, limit: 255
      t.text :content
      t.belongs_to :creator, null: false

      t.timestamps
    end
    add_index :stories, :creator_id
  end
end
