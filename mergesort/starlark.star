def merge(left, right):
    result = []
    i = 0
    j = 0
    for _ in range(len(left) + len(right)):
        if i >= len(left):
            result.extend(right[j:])
            break
        if j >= len(right):
            result.extend(left[i:])
            break
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    return result

def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    left = merge_sort(arr[:mid])
    right = merge_sort(arr[mid:])
    return merge(left, right)

arr = [38, 27, 43, 3, 9, 82, 10]
print(merge_sort(arr))
