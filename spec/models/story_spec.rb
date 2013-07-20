# == Schema Information
#
# Table name: stories
#
#  id                 :integer(4)      not null, primary key
#  title              :string(255)     not null
#  content            :text
#  creator_id         :integer(4)      not null
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  total_distance_km  :integer(10)     not null
#  total_climbing_m   :integer(10)     not null
#  total_descending_m :integer(10)     not null
#  subtype            :integer(1)      not null
#  difficulty_index   :integer(10)     not null
#

require 'spec_helper'

describe Story do
  pending "add some examples to (or delete) #{__FILE__}"
end
