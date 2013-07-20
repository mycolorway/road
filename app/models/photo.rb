# == Schema Information
#
# Table name: photos
#
#  id         :integer         not null, primary key
#  attachment :string(255)
#  story_id   :integer         not null
#  creator_id :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Photo < ActiveRecord::Base
  belongs_to :story
  belongs_to :creator, class_name: 'User'

  validates :story, :creator, presence: true

  mount_uploader :attachment, AttachmentUploader
end
