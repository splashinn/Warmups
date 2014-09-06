# Flatten an array

def flatten_2(array)
    flat_array = []
        while array.first
            if array.first.class != Array
                flat_array.push(array.shift)
            else
                array.shift.reverse_each { |el| array.unshift(el) }
            end
        end
    flat_array
end