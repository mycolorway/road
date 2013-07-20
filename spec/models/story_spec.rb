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

require 'spec_helper'

describe Story do
  pending "add some examples to (or delete) #{__FILE__}"
end
