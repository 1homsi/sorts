MAX_LEN: constant(uint256) = 100

@internal
def cocktail_sort(arr: int128[MAX_LEN], n: uint256) -> int128[MAX_LEN]:
    swapped: bool = True
    start: uint256 = 0
    end: uint256 = n - 1
    tmp: int128 = 0
    for _outer in range(MAX_LEN):
        if not swapped:
            break
        swapped = False
        for i in range(MAX_LEN):
            if i >= end - start:
                break
            idx: uint256 = start + convert(i, uint256)
            if arr[idx] > arr[idx + 1]:
                tmp = arr[idx]
                arr[idx] = arr[idx + 1]
                arr[idx + 1] = tmp
                swapped = True
        if not swapped:
            break
        swapped = False
        end -= 1
        for i in range(MAX_LEN):
            if i >= end - start:
                break
            idx: uint256 = end - 1 - convert(i, uint256)
            if arr[idx] > arr[idx + 1]:
                tmp = arr[idx]
                arr[idx] = arr[idx + 1]
                arr[idx + 1] = tmp
                swapped = True
        start += 1
    return arr
