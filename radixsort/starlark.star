def get_digit(x, exp):
    return (x // exp) % 10

def counting_sort(arr, exp):
    result = []
    for d in range(10):
        for x in arr:
            if get_digit(x, exp) == d:
                result.append(x)
    return result

def radix_sort(arr):
    if not arr:
        return arr
    max_val = max(arr)
    exp = 1
    result = list(arr)
    while max_val // exp > 0:
        result = counting_sort(result, exp)
        exp *= 10
    return result

arr = [170, 45, 75, 90, 802, 24, 2, 66]
print(radix_sort(arr))
