# Flatten an array

def flatten(array)
    while array.any? { |el| el.class == Array }
        tmp_array = []
        array.each do |el|
            if el.class == Array
                el.each { |element| tmp_array.push(element) }
            else
                tmp_array.push(el)
            end
        end
        array = tmp_array
    end
    array
end