json.extract! story, :title, :content, :total_distance_km, :total_climbing_m,
    :total_descending_m, :difficulty_index
json.show_url story_url(story)
json.static_map_url story.static_map_url_baidu
json.path_nodes_url story_path_nodes_url(story, format: :json)
json.photos_url story_photos_url(story, format: :json)
