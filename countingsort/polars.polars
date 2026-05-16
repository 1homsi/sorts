def counting_sort(arr):
    if not arr:
        return arr
    min_val = min(arr)
    max_val = max(arr)
    range_val = max_val - min_val + 1
    count = [0] * range_val
    for v in arr:
        count[v - min_val] += 1
    for i in range(1, range_val):
        count[i] += count[i - 1]
    output = [0] * len(arr)
    for v in reversed(arr):
        count[v - min_val] -= 1
        output[count[v - min_val]] = v
    return output

arr = [4, 2, 2, 8, 3, 3, 1]
print(counting_sort(arr))
