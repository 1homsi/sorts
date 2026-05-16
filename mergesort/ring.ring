func merge left, right
    result = []
    i = 1; j = 1
    while i <= len(left) and j <= len(right)
        if left[i] <= right[j]
            add(result, left[i]); i++
        else
            add(result, right[j]); j++
        end
    end
    while i <= len(left); add(result, left[i]); i++; end
    while j <= len(right); add(result, right[j]); j++; end
    return result

func mergesort arr
    if len(arr) <= 1; return arr; end
    mid = len(arr) / 2
    left = mergesort(arr[1..mid])
    right = mergesort(arr[mid+1..len(arr)])
    return merge(left, right)

arr = [38, 27, 43, 3, 9, 82, 10]
sorted = mergesort(arr)
see sorted
