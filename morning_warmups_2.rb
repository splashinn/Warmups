# Exercise 1: FizzBuzz

1.upto(100) do |i|
	if i % 5 == 0 && i % 3 == 0
		puts "FizzBuzz"
	elsif i % 5 == 0
		puts "Buzz"
	elsif i % 3 == 0
		puts "Fizz"
	else
		puts i
	end
end

# Exercise 1: Another solution:

def fizzbuzz(maximum)
  1.upto(maximum).each do |n|
    line = ''
    line << 'Fizz' if n % 3 == 0
    line << 'Buzz' if n % 5 == 0
    line = n if line.empty?
    puts line
  end
end

p fizzbuzz(1000)

# Exercise 2: First non-repeated character

def first_non_repeat(string)
	string1 = string.split("")
	string2 = string.split("")

	string1.each do |i|
		counter = 0
		string2.each do |j|
			if i == j
				counter += 1
			end
		end
		if counter == 1
			return i
			break
		end
	end
end

# Exercise 2: Another solution:

def first_non_repeat_1(input)
  chars = input.chars
      chars.each do |char|
         if chars.count(char) == 1
        puts char
        break
      end
    end
end

p first_non_repeat("Hello")
p first_non_repeat("LLama")
p first_non_repeat("Cheeseburger")

p first_non_repeat_1("Heyy")
p first_non_repeat_1("Gabba")
p first_non_repeat_1("Beehive")

# Exercise 3: Getting close

my_results = [  {name: "six pack of beer", location: {lat: 37.767182, long: -122.5}},
                {name: "whacky glasses", location: {lat: 37.767182, long: -122.51}},
                {name: "whiskey bottle", location: {lat: 37.767282, long: -122.49}},
                {name: "diving goggles", location: {lat: 37.770282, long: -122.503}},
                {name: "running shoes", location: {lat: 37.7669, long: -122.457}},
                {name: "paint brushes", location: {lat: 37.76800, long: -122.4580}}]

def proximity_sort(results, current_location)
    lat = current_location[:lat]
    long = current_location[:long]
    results.sort {|result| dist = ((result[:location][:lat]-lat)**2 + (result[:location][:long]-long)**2)**(0.5)}
end

puts proximity_sort(my_results, {lat: 37.76800, long: -122.4580})
