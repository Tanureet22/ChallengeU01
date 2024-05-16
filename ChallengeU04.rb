require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response)

ash_trees = 0

tree_data.each do |tree|
  species_name = tree['species_name']
  if species_name && species_name.downcase.include?('ash')
    ash_trees += 1
  end
end

puts "Number of Ash trees in the dataset: #{ash_trees}"
