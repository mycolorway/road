# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.exists?
  FactoryGirl.create :user, email: 'snow@mycolorway.com'
end

unless Story.exists?
  user = User.first!

  sample_dir = Rails.root.join('db')
  sample_dir.entries.each_with_index do |file, idx|
    next unless '.gpx' == file.extname

    doc = Nokogiri::XML sample_dir.join(file).open

    subtype = if 2 == idx
                Story::SUBTYPE_HIKING
              else
                Story::SUBTYPE_BIKING
              end
    story = Story.create! title: doc.css('trk > name').inner_text,
      creator: user, subtype: subtype

    points = []
    doc.css('trkpt').each do |trkpt|
      points << {
        latitude: trkpt['lat'],
        longitude: trkpt['lon'],
        elevation: (trkpt>'ele').inner_text,
        created_at: (trkpt>'time').inner_text
      }
    end

    points.sort{ |x, y| x[:timestamp] <=> y[:timestamp] }.each do |point|
      story.path_nodes.create! point
    end

    story.update_stat!
  end
end

if Story.where(id: 2).exists?
  story = Story.find 2
  user = User.first!

  sample_dir = Rails.root.join('db')
  sample_dir.entries.each do |file|
    next unless '.jpg' == file.extname

    story.photos.create! attachment: sample_dir.join(file).open, creator: user
  end
end
