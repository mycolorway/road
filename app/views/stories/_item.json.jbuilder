json.extract! story, :title, :content, :subtype

json.total_distance_km story.total_distance_km.round(2)
json.total_climbing_m story.total_climbing_m.round(2)
json.total_descending_m story.total_descending_m.round(2)
json.difficulty_index story.difficulty_index.round(2)

json.show_url story_url(story)
json.static_map_url story.static_map_url_baidu
json.path_nodes_url story_path_nodes_url(story, format: :json)
json.photos_url story_photos_url(story, format: :json)
json.pois_url story_pois_url(story, format: :json)
