CHENGDU_LAT_N = 30.726763044272605
CHENGDU_LAT_S = 30.594197882722504
CHENGDU_LNG_E = 104.20847654342651
CHENGDU_LNG_W = 103.98333728313446

FactoryGirl.define do
  sequence(:email){ Faker::Internet.email }
  sequence :content, aliases: [:description] do
    "#{Time.now.strftime '%m%d %H%M%S.%L'} #{Faker::Lorem.paragraph[0,60]}"
  end

  factory :user, aliases: [:creator] do
    email
    password '123123123'
    password_confirmation '123123123'
  end

  #factory :geo_point do
    #sequence(:latitude) { rand CHENGDU_LAT_S..CHENGDU_LAT_N }
    #sequence(:longitude) { rand CHENGDU_LNG_W..CHENGDU_LNG_E }
    #sequence(:altitude) { rand 499.645..507.388 }
    #association_updated_at { Time.now }

    #story
    #creator

    #trait :by_dev_user do
      #creator { User.first }
    #end

    #factory :path_node, class: PathNode do
    #end

    #factory :poi, class: Poi do
    #end
  #end

  #factory :story do
    #title { Faker::Lorem.sentence }
    #description

    #creator

    #trait :by_dev_user do
      #creator { User.first }
    #end

    #factory :story_with_path_nodes do
      #ignore do
        #path_nodes_count { rand 5..20 }
      #end

      #after(:create) do |record, evaluator|
        #FactoryGirl.create_list :path_node, evaluator.path_nodes_count,
          #story: record, creator: record.creator
      #end
    #end
  #end
end
