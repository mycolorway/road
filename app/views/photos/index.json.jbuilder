json.array! @photos do |photo|
  json.full photo.attachment.url
  json.thumb photo.attachment.thumb.url
end
