get-digit = (x, exp) -> Math.floor(x / exp) % 10

counting-sort = (arr, exp) ->
    result = []
    for d from 0 to 9
        for x in arr
            result.push x if get-digit(x, exp) == d
    result

radix-sort = (arr) ->
    return arr if arr.length == 0
    max-val = Math.max ...arr
    exp = 1
    result = arr
    while Math.floor(max-val / exp) > 0
        result = counting-sort result, exp
        exp *= 10
    result

arr = [170, 45, 75, 90, 802, 24, 2, 66]
console.log radix-sort arr
