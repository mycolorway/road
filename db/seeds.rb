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
  sample_dir.entries.each do |file|
    next unless '.gpx' == file.extname

    doc = Nokogiri::XML sample_dir.join(file).open

    ActiveRecord::Base.transaction do
      story = Story.create! title: doc.css('trk > name').inner_text, creator: user

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
    end
  end
end
