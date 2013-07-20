# == Schema Information
#
# Table name: stories
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  body       :text
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
end
