get_digit = (x, exp) -> math.floor(x / exp) % 10

counting_sort = (arr, exp) ->
    result = {}
    for d = 0, 9
        for _, x in ipairs arr
            table.insert result, x if get_digit(x, exp) == d
    result

radix_sort = (arr) ->
    return arr if #arr == 0
    max_val = math.max table.unpack arr
    exp = 1
    result = arr
    while math.floor(max_val / exp) > 0
        result = counting_sort result, exp
        exp *= 10
    result

arr = {170, 45, 75, 90, 802, 24, 2, 66}
print table.concat radix_sort(arr), " "
