class AddSubtypeAndDifficultyToStory < ActiveRecord::Migration
  def up
    change_table :stories do |t|
      t.column :subtype, 'tinyint unsigned'
      t.decimal :difficulty_index, precision: 10, scale: 2
    end

    # save each instance intead of `Story.update_all`
    # to trigger difficulty calculation on before_validation hook
    Story.find_each do |story|
      story.subtype = if 3 == story.id
                        Story::SUBTYPE_HIKING
                      else
                        Story::SUBTYPE_BIKING
                      end
      story.save
    end

    change_column :stories, :subtype, 'tinyint unsigned', null: false
    change_column :stories, :difficulty_index, :decimal, null: false
  end

  def down
    remove_column :stories, :subtype
    remove_column :stories, :difficulty_index
  end
end
