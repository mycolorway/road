json.array! @photos do |photo|
  json.partial! 'item', photo: photo
end
