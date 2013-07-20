json.array! @path_nodes do |path_node|
  json.partial! 'item', path_node: path_node
end
