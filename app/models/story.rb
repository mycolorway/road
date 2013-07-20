# == Schema Information
#
# Table name: stories
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  content    :text
#  creator_id :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Story < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  has_many :path_nodes
  has_many :pois
  has_many :geo_points, dependent: :destroy

  has_many :photos

  validates :title, :creator, presence: true

  # ------
  # scopes
  # ------

  def self.by_bounds(lat_n, lng_e=nil, lat_s=nil, lng_w=nil)
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
    where('title like ? or description like ?', q ,q)
  end

  # ----------
  # attributes
  # ----------

  def static_map_url_baidu(width=100, height=100)
    center_lat = (path_nodes.map(&:latitude).inject{ |sum, ele| sum + ele } / path_nodes.length).round(6)
    center_lng = (path_nodes.map(&:longitude).inject{ |sum, ele| sum + ele } / path_nodes.length).round(6)

    points_query = path_nodes.map{ |node| "#{node.longitude.round(6)},#{node.latitude.round(6)}"}.join(';')

    'http://api.map.baidu.com/staticimage?'\
      "center=#{center_lng},#{center_lat}&width=#{width}&height=#{height}&"\
      "paths=#{points_query}&pathStyles=0xff0000,1,1"
  end

  # km
  def total_distance_km
    # TODO
    100
  end

  # m
  def total_climbing_m
    # TODO
    100
  end

  # m
  def total_descending_m
    # TODO
    100
  end

  def difficulty_index
    # TODO
    10
  end
end
