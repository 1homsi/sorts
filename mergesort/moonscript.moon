merge = (left, right) ->
    result = {}
    i, j = 1, 1
    while i <= #left and j <= #right
        if left[i] <= right[j]
            table.insert result, left[i]
            i += 1
        else
            table.insert result, right[j]
            j += 1
    while i <= #left
        table.insert result, left[i]
        i += 1
    while j <= #right
        table.insert result, right[j]
        j += 1
    result

merge_sort = (arr) ->
    n = #arr
    return arr if n <= 1
    mid = math.floor n / 2
    left_part = [arr[k] for k = 1, mid]
    right_part = [arr[k] for k = mid+1, n]
    merge merge_sort(left_part), merge_sort(right_part)

arr = {38, 27, 43, 3, 9, 82, 10}
sorted = merge_sort arr
print table.concat sorted, " "
