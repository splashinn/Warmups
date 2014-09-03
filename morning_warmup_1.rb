# Exercise 1: Primes from 1 to 500

def print_primes(num)
	arr_of_primes = [2]
	i = 3

	while i < num
		is_prime = true
		for j in 3...i
			if i % j == 0
				is_prime = false
				break
			end
		end
		if is_prime == true
			arr_of_primes.push(i)
		end
		i += 2
	end
	STDOUT.puts(arr_of_primes.join(", "))
end

print_primes(500)
