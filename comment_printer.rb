require 'Typhoeus'
require 'json'
require 'ap'


def display_children(father, level)
	if father.has_key?('replies') && father['replies'] != ""
		level += 1
		father['replies']['data']['children'].each do |children|
			level.times {print "    "}
			print "- #{children['data']['body']}\n"
			display_children(children['data'], level)
		end
	end
end


response = Typhoeus.get ("http://www.reddit.com/r/aww/comments/2fam7n/nothing_like_a_protective_sibling.json")
my_hash = JSON.parse response.body

#Print title
puts my_hash[0]['data']['children'][0]['data']['title']

#Print all the comments
my_hash[1]['data']['children'].each do |comment|
	level = 0
	puts "+ #{comment['data']['body']}"
			
	display_children(comment['data'], level)
end
