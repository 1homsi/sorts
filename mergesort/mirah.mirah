import java.util.ArrayList
import java.util.List

def merge(left:List, right:List):List
    result = ArrayList.new
    i = 0; j = 0
    while i < left.size && j < right.size
        if Integer(left.get(i)) <= Integer(right.get(j))
            result.add(left.get(i)); i += 1
        else
            result.add(right.get(j)); j += 1
        end
    end
    while i < left.size; result.add(left.get(i)); i += 1; end
    while j < right.size; result.add(right.get(j)); j += 1; end
    result
end

def mergeSort(arr:List):List
    return arr if arr.size <= 1
    mid = arr.size / 2
    left = mergeSort(arr.subList(0, mid))
    right = mergeSort(arr.subList(mid, arr.size))
    merge(left, right)
end

arr = [38, 27, 43, 3, 9, 82, 10]
puts mergeSort(arr)
