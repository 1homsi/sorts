import java.util.ArrayList
import java.util.Collections

def is_sorted(arr:ArrayList):boolean
    i = 0
    while i < arr.size - 1
        if Integer(arr.get(i)) > Integer(arr.get(i + 1))
            return false
        end
        i += 1
    end
    true
end

def bogosort(arr:ArrayList):ArrayList
    while !is_sorted(arr)
        Collections.shuffle(arr)
    end
    arr
end

arr = ArrayList.new([3, 1, 4, 1, 5, 9, 2, 6])
puts bogosort(arr)
