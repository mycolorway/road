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
  belongs_to :creator
  attr_accessible :body, :title
end
