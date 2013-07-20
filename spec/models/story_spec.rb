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

require 'spec_helper'

describe Story do
  pending "add some examples to (or delete) #{__FILE__}"
end
