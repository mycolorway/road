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

class PathNode < GeoPoint
  before_validation do
    self.creator = story.creator if creator.blank?
  end

  after_create do
    self.class.delay.sync_to_baidu id
  end

  def self.sync_to_baidu(record_id)
    record = find record_id

    resp = JSON.parse RestClient.post 'http://api.map.baidu.com/geodata/poi?method=create',
      name: "PathNode_#{record.id}",
      original_lat: record.latitude,
      original_lon: record.longitude,
      original_coord_type: 3,
      databox_id: Yetting.baidu_lbs_databox_id,
      ak: Yetting.baidu_ak

    return unless 0 == resp['status'] && resp['id'].present?

    record.baidu_id = resp['id']

    resp = JSON.parse RestClient.get 'http://api.map.baidu.com/geodata/poi/'\
      "#{record.baidu_id}?ak=#{Yetting.baidu_ak}"

    Rails.logger.warn resp
    return unless 0 == resp['status']

    record.baidu_lat = resp['poi']['latitude']
    record.baidu_lng = resp['poi']['longitude']
    record.save
  end
end
