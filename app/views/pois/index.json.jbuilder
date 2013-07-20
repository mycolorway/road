json.array! @pois do |poi|
  json.partial! 'item', poi: poi
end
