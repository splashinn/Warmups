# Load in all the shakespeare and remove newline characters
def load_shakespeare
  File.read(File.dirname(__FILE__) + '/Shakespeare.txt').delete("\n")
end

shakespeare = load_shakespeare()

# ********************

# REGEX DRILLS
# Use regular expressions to answer the following questions:

# How many words does Shakespeare use?
shakespeare.split(/\w+/).count

# How many different words does Shakespeare use?
shakespeare.scan(/\w+/).uniq.count

# How many times does Shakespeare use the word 'the'?
shakespeare.scan.(/the/i).count

# How many times does Shakespeare write "guildenstern" or "Guildenstern"
shakespeare.scan.(/guildenstern/i).count

# Find the entire "To be, or not to be- that is the question:" with as few regex characters as possible
shakespeare.scan(/To be, or[-: \w+]/)

# ********************

# Write a method that accepts a word and returns all the words in Shakespeare.txt that follow that word.
# In other words, words_after('to') will return an array of words which include 'be'... since Shakespeare writes "to be"
def words_after(word)
  shakespeare = File.read(File.dirname(__FILE__) + '/Shakespeare.txt')
  shakespeare.scan(Regexp.new(word + ' (\w+)')).uniq.flatten
end

#This should be true:
# words_after('to').include?('be')
	#=> true
