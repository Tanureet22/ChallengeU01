require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response)

puts "Dog Breeds:"
dog_breeds["message"].each do |breed, sub_breeds|
  puts "- #{breed}"
  if sub_breeds.is_a? Array
    puts "  Sub-breeds:"
    sub_breeds.each { |sub_breed| puts "    - #{sub_breed}" }
  end
end
