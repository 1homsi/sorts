# @version ^0.3.0

MAX_SIZE: constant(uint256) = 100

@internal
def _shell_sort(arr: uint256[7]) -> uint256[7]:
    n: uint256 = 7
    gap: uint256 = n / 2
    a: uint256[7] = arr
    for _g: uint256 in range(20):
        if gap == 0:
            break
        for i: uint256 in range(MAX_SIZE):
            if i < gap or i >= n:
                continue
            temp: uint256 = a[i]
            j: uint256 = i
            for _j: uint256 in range(MAX_SIZE):
                if j < gap or a[j - gap] <= temp:
                    break
                a[j] = a[j - gap]
                j -= gap
            a[j] = temp
        gap /= 2
    return a

@external
def sort() -> uint256[7]:
    arr: uint256[7] = [64, 34, 25, 12, 22, 11, 90]
    return self._shell_sort(arr)
