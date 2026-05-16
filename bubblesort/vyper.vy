MAX_LEN: constant(uint256) = 100

@internal
def _bubble_sort(arr: uint256[7]) -> uint256[7]:
    a: uint256[7] = arr
    n: uint256 = 7
    swapped: bool = True
    for _outer: uint256 in range(7):
        if not swapped:
            break
        swapped = False
        for i: uint256 in range(6):
            if i >= n - 1:
                break
            if a[i] > a[i + 1]:
                tmp: uint256 = a[i]
                a[i] = a[i + 1]
                a[i + 1] = tmp
                swapped = True
        n -= 1
    return a

@external
def sort() -> uint256[7]:
    arr: uint256[7] = [64, 34, 25, 12, 22, 11, 90]
    return self._bubble_sort(arr)
