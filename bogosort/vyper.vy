@pure
@internal
def is_sorted(arr: DynArray[int128, 100], n: uint256) -> bool:
    for i: uint256 in range(99):
        if i >= n - 1:
            break
        if arr[i] > arr[i + 1]:
            return False
    return True

@external
def bogosort(arr: DynArray[int128, 100]) -> DynArray[int128, 100]:
    result: DynArray[int128, 100] = arr
    n: uint256 = len(arr)
    for _iter: uint256 in range(10000):
        if self.is_sorted(result, n):
            break
        for i: uint256 in range(99):
            if i >= n:
                break
            j: uint256 = convert(block.prevrandao % n, uint256)
            tmp: int128 = result[i]
            result[i] = result[j]
            result[j] = tmp
    return result
