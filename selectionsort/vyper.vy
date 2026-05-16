@internal
def _selection_sort(arr: DynArray[int128, 100], n: uint256) -> DynArray[int128, 100]:
    result: DynArray[int128, 100] = arr
    for i: uint256 in range(100):
        if i >= n:
            break
        min_idx: uint256 = i
        for j: uint256 in range(100):
            if j <= i or j >= n:
                continue
            if result[j] < result[min_idx]:
                min_idx = j
        tmp: int128 = result[i]
        result[i] = result[min_idx]
        result[min_idx] = tmp
    return result
