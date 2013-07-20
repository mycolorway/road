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

require 'spec_helper'

describe Photo do
  pending "add some examples to (or delete) #{__FILE__}"
end
