class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :attachment
      t.belongs_to :story, null: false, index: true
      t.belongs_to :creator, null: false

      t.timestamps
    end
    add_index :photos, :story_id
    add_index :photos, :creator_id
  end
end
