def counting_sort(arr):
    if not arr:
        return arr
    max_val = max(arr)
    min_val = min(arr)
    range_val = max_val - min_val + 1
    count = [0] * range_val
    for num in arr:
        count[num - min_val] += 1
    for i in range(1, range_val):
        count[i] += count[i - 1]
    output = [0] * len(arr)
    for num in reversed(arr):
        output[count[num - min_val] - 1] = num
        count[num - min_val] -= 1
    return output

arr = [4, 2, 2, 8, 3, 3, 1]
print(counting_sort(arr))
