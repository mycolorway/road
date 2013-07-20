# == Schema Information
#
# Table name: geo_points
#
#  id                    :integer(4)      not null, primary key
#  sti_type              :string(255)     not null
#  latitude              :decimal(10, 6)  not null
#  longitude             :decimal(10, 6)  not null
#  elevation             :decimal(10, 2)  not null
#  attributes_updated_at :datetime        not null
#  story_id              :integer(4)      not null
#  creator_id            :integer(4)
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  subtype               :integer(1)      default(0), not null
#  description           :text
#  title                 :string(255)     default(""), not null
#  baidu_id              :integer(4)
#  baidu_lat             :decimal(10, 6)
#  baidu_lng             :decimal(10, 6)
#

class GeoPoint < ActiveRecord::Base
  self.inheritance_column = :sti_type

  belongs_to :story
  belongs_to :creator, class_name: 'User'

  validates :story, :creator, presence: true

  before_validation do
    self.attributes_updated_at = Time.now if attributes_updated_at.blank?
  end
end
