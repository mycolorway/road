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
#  subtype               :integer         default(0), not null
#  description           :text
#

class PathNode < GeoPoint
  before_validation do
    self.creator = story.creator if creator.blank?
  end
end
