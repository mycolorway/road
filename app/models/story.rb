# == Schema Information
#
# Table name: stories
#
#  id                 :integer(4)      not null, primary key
#  subtype            :integer(1)      not null
#  title              :string(255)     not null
#  content            :text
#  total_distance_km  :decimal(10, 2)  default(0.0), not null
#  total_climbing_m   :decimal(10, 2)  default(0.0), not null
#  total_descending_m :decimal(10, 2)  default(0.0), not null
#  difficulty_index   :decimal(10, 2)  default(0.0), not null
#  creator_id         :integer(4)      not null
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class Story < ActiveRecord::Base
  SUBTYPE_BIKING = 1
  SUBTYPE_HIKING = 2

  belongs_to :creator, class_name: 'User'

  has_many :path_nodes
  has_many :pois
  has_many :geo_points, dependent: :destroy

  has_many :photos

  validates :title, :creator, presence: true

  before_validation do
    self.total_distance_km = cal_total_distance if total_distance_km.blank?

    self.total_climbing_m, self.total_descending_m = \
      cal_total_climbing_and_descending \
      if total_climbing_m.blank? || total_descending_m.blank?

    self.difficulty_index = cal_difficulty_index if difficulty_index.blank?
  end

  # ------
  # scopes
  # ------

  def self.by_bounds(lat_n, lng_e=nil, lat_s=nil, lng_w=nil)
    resp = JSON.parse RestClient.get 'http://api.map.baidu.com/geosearch/poi',
      params: {
        bounds: "#{lat_s},#{lng_w};#{lat_n},#{lng_e}",
        filter: "databox:#{Yetting.baidu_lbs_databox_id}",
        ak: Yetting.baidu_ak
      }

    if 0 == resp['status']
      baidu_ids = resp['content'].map{ |p| p['uid'] }
      where id: PathNode.where(baidu_id: baidu_ids).pluck(:story_id).uniq
    else
      raise resp['message']
    end
  rescue => err
    Rails.logger.warn 'Failed in http://api.map.baidu.com/geosearch/poi:' \
      "#{err.inspect}"

    if lat_n.is_a? Hash
      lng_e = lat_n[:lng_e]
      lat_s = lat_n[:lat_s]
      lng_w = lat_n[:lng_w]
      lat_n = lat_n[:lat_n]
    end

    where(id: PathNode.where('(latitude >= ? or latitude <= ?) and '\
                             '(longitude >= ? or longitude <= ?)',
                             [lat_n, lat_s].min,
                             [lat_n, lat_s].max,
                             [lng_e, lng_w].min,
                             [lng_e, lng_w].max).pluck(:story_id).uniq)
  end

  def self.by_keyword(q)
    q = "%#{q}%"
    where('title like ? or content like ?', q ,q)
  end

  def self.biking
    where(subtype: SUBTYPE_BIKING)
  end

  def self.hiking
    where(subtype: SUBTYPE_HIKING)
  end

  # ----------
  # attributes
  # ----------

  def has_path?
    1 < path_nodes.count
  end

  def static_map_url_baidu(width=100, height=100)
    center_lat = (path_nodes.map(&:latitude).inject{ |sum, ele| sum + ele } / \
                  path_nodes.length).round(6)
    center_lng = (path_nodes.map(&:longitude).inject{ |sum, ele| sum + ele } / \
                  path_nodes.length).round(6)

    nodes = path_nodes.where('baidu_lat is not null and baidu_lng is not null')
    if 500 < nodes.count
      slice_size = (path_nodes.count / 500).ceil
      nodes = nodes.each_slice(slice_size).map{ |slice| slice.first }
    end

    points_query = nodes.map{ |node| "#{node.baidu_lng},#{node.baidu_lat}" }.\
      join(';')

    color = if hiking?
              '0x037d8f'
            else
              '0xd60000'
            end

    'http://api.map.baidu.com/staticimage?'\
      "center=#{center_lng},#{center_lat}&width=#{width}&height=#{height}&"\
      "paths=#{points_query}&pathStyles=#{color},6,0.9"
  end

  def biking?
    SUBTYPE_BIKING == subtype
  end

  def hiking?
    SUBTYPE_HIKING == subtype
  end

  # --------------
  # business logic
  # --------------
  def update_stat!
    self.total_distance_km = nil
    self.total_climbing_m = nil
    self.total_descending_m = nil
    self.difficulty_index = nil
    self.save!
  end

  def cal_total_distance
    result = 0
    path_nodes.each_with_index do |cur_node, idx|
      next if 0 == idx

      prev_node = path_nodes[idx - 1]
      result += Geocoder::Calculations.distance_between(
        [cur_node.latitude, cur_node.longitude],
        [prev_node.latitude, prev_node.longitude],
        units: :km)
    end
    result
  end

  def cal_total_climbing_and_descending
    climbing = 0
    descending = 0

    path_nodes.each_with_index do |cur_node, idx|
      next if 0 == idx

      prev_node = path_nodes[idx - 1]
      diff = cur_node.elevation - prev_node.elevation
      if diff > 0
        climbing += diff
      else
        descending += -diff
      end
    end

    [climbing, descending]
  end

  def cal_difficulty_index
    if has_path?
      t = path_nodes.maximum(:elevation)
      d = total_distance_km * 1000
      if biking?
        h = t - path_nodes.minimum(:elevation)
        (h * 100 / d) * 2 + h * h / d + d / 1000 + (t - 1000) / 100
      else
        c = total_climbing_m
        0.1 * c * c / d + 40 * c / d + d / 1000 + t / 1000
      end
    else
      0
    end
  end

  def self.create_by_gps
  end

  def self.gen_poster_snapshot(record_id)
    record = find record_id
    snapshot_dir = Rails.root.join("public/posters/#{record_id}").to_s
    `phantomjs lib/poster_snapshoot.js 'http://#{Yetting.host}/stories/#{record_id}/poster' '#{snapshot_dir}/wide.jpg'`
    `phantomjs lib/poster_snapshoot.js 'http://#{Yetting.host}/stories/#{record_id}/poster?slim' '#{snapshot_dir}/slim.jpg'`
  end
end
