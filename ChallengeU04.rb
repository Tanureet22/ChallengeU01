require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response)

def count_ash_trees(tree_data)
  ash_tree_count = 0
  tree_data.each do |tree|
    if tree['common_name']&.downcase&.include?('ash') || tree['scientific_name']&.downcase&.include?('fraxinus')
      ash_tree_count += 1
    end
  end
  ash_tree_count
end

ash_count = count_ash_trees(tree_data)
puts "Number of ash trees in Winnipeg: #{ash_count}"
