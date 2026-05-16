MAX_N: constant(uint256) = 100

@internal
def _insertion_sort(bucket: DynArray[int256, MAX_N]) -> DynArray[int256, MAX_N]:
    arr: DynArray[int256, MAX_N] = bucket
    n: uint256 = len(arr)
    for i: uint256 in range(1, MAX_N):
        if i >= n:
            break
        key: int256 = arr[i]
        j: uint256 = i
        for _k: uint256 in range(MAX_N):
            if j == 0:
                break
            if arr[j - 1] <= key:
                break
            arr[j] = arr[j - 1]
            j -= 1
        arr[j] = key
    return arr

@external
def bucket_sort(arr: DynArray[int256, MAX_N]) -> DynArray[int256, MAX_N]:
    n: uint256 = len(arr)
    if n == 0:
        return arr
    min_v: int256 = arr[0]
    max_v: int256 = arr[0]
    for v: int256 in arr:
        if v < min_v:
            min_v = v
        if v > max_v:
            max_v = v
    buckets: DynArray[DynArray[int256, MAX_N], MAX_N] = []
    for _i: uint256 in range(MAX_N):
        if _i >= n:
            break
        buckets.append([])
    for num: int256 in arr:
        idx: uint256 = convert((num - min_v) * convert(n, int256) / (max_v - min_v + 1), uint256)
        if idx >= n:
            idx = n - 1
        buckets[idx].append(num)
    result: DynArray[int256, MAX_N] = []
    for b: DynArray[int256, MAX_N] in buckets:
        sorted_b: DynArray[int256, MAX_N] = self._insertion_sort(b)
        for v: int256 in sorted_b:
            result.append(v)
    return result
