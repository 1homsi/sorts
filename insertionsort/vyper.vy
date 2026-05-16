@internal
def _insertion_sort(arr: int128[100], n: uint256) -> int128[100]:
    for i: uint256 in range(1, 100):
        if i >= n:
            break
        key: int128 = arr[i]
        j: int256 = convert(i, int256) - 1
        for _k: uint256 in range(100):
            if j < 0 or arr[convert(j, uint256)] <= key:
                break
            arr[convert(j + 1, uint256)] = arr[convert(j, uint256)]
            j -= 1
        arr[convert(j + 1, uint256)] = key
    return arr
