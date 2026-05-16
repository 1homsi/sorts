merge = (left, right) ->
    result = []
    i = 0; j = 0
    while i < left.length and j < right.length
        if left[i] <= right[j]
            result.push left[i++]
        else
            result.push right[j++]
    while i < left.length then result.push left[i++]
    while j < right.length then result.push right[j++]
    result

merge-sort = (arr) ->
    return arr if arr.length <= 1
    mid = Math.floor arr.length / 2
    left = merge-sort arr.slice(0, mid)
    right = merge-sort arr.slice(mid)
    merge left, right

arr = [38, 27, 43, 3, 9, 82, 10]
console.log merge-sort arr
