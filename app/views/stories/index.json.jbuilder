json.array! @stories do |story|
  json.partial! 'item', story: story 
end
