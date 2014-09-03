# Warmup 9
# Flattening an Array

def flatten_array(arr, level = -1, result = [])
  arr.each do |x|
    if Array === x && level != 0
      flatten_array x, level - 1, result
    else
      result << x
    end
  end
  
  result
end


p flatten_array([1,2,[3,4],[5,[6]]])
p flatten_array([[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10])