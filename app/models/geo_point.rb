# == Schema Information
#
# Table name: geo_points
#
#  id                    :integer         not null, primary key
#  sti_type              :string(255)     not null
#  latitude              :decimal(, )     not null
#  longitude             :decimal(, )     not null
#  elevation             :decimal(, )     not null
#  attributes_updated_at :datetime        not null
#  story_id              :integer         not null
#  creator_id            :integer
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#

class GeoPoint < ActiveRecord::Base
  self.inheritance_column = :sti_type

  belongs_to :story
  belongs_to :creator, class_name: 'User'

  before_validation do
    self.attributes_updated_at = Time.now if attributes_updated_at.blank?
  end
end
