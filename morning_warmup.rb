# Exercise 1: You are given 3 coins of value 1, 3 and 5. You are also given a total which you have to arrive at.
# Find the minimum number of coins to arrive at it.

def min_coins(total)
    result = 0
    result = (total/5).to_i
    total = total % 5
    result += (total/3).to_i
    total = total % 3
    result += total

    puts result
end

min_coins(11)
min_coins(20)
min_coins(99)
min_coins(100)
min_coins(149)

# Exercise 2: Given a string comprising just of the characters (), {}, [], determine if it is well-formed or not.

def parens_check(str)
	if str == '()'
		return true
	elsif str == '{}'
		return true
	elsif str == '[]'
		return true
	else
		return false
	end

end

p parens_check('{}')
p parens_check('[]')
p parens_check('()')
p parens_check('[{()}]')
