def Merge(left as (int), right as (int)) as (int):
    result = List[of int]()
    i, j = 0, 0
    while i < left.Length and j < right.Length:
        if left[i] <= right[j]:
            result.Add(left[i])
            i += 1
        else:
            result.Add(right[j])
            j += 1
    while i < left.Length:
        result.Add(left[i])
        i += 1
    while j < right.Length:
        result.Add(right[j])
        j += 1
    return result.ToArray()

def MergeSort(arr as (int)) as (int):
    if arr.Length <= 1:
        return arr
    mid = arr.Length / 2
    left = arr[:mid]
    right = arr[mid:]
    return Merge(MergeSort(left), MergeSort(right))

data = (5, 2, 8, 1, 9, 3)
for x in MergeSort(data):
    print x
