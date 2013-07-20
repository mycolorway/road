module ApplicationHelper  
  def random_cover(story)
    len = story.photos.length
    story.photos[Random.rand(len)].attachment.url
  end
end
