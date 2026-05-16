MAX_SIZE: constant(uint256) = 1024

@internal
def _comb_sort(arr: int256[MAX_SIZE], n: uint256) -> int256[MAX_SIZE]:
    gap: uint256 = n
    sorted: bool = False
    tmp: int256 = 0
    for _iter: uint256 in range(1000):
        gap = (gap * 10) / 13
        if gap <= 1:
            gap = 1
            sorted = True
        for i: uint256 in range(MAX_SIZE):
            if i + gap >= n:
                break
            if arr[i] > arr[i + gap]:
                tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = False
        if sorted and gap == 1:
            break
    return arr
