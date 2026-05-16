MIN_RUN: constant(uint256) = 32

@internal
def insertion_sort(arr: uint256[256], left: uint256, right: uint256) -> uint256[256]:
    i: uint256 = left + 1
    for _i: uint256 in range(256):
        if i > right:
            break
        key: uint256 = arr[i]
        j: uint256 = i
        for _j: uint256 in range(256):
            if j <= left or arr[j-1] <= key:
                break
            arr[j] = arr[j-1]
            j -= 1
        arr[j] = key
        i += 1
    return arr

@internal
def merge(arr: uint256[256], left: uint256, mid: uint256, right: uint256) -> uint256[256]:
    lp: uint256[256] = empty(uint256[256])
    rp: uint256[256] = empty(uint256[256])
    ln: uint256 = mid - left + 1
    rn: uint256 = right - mid
    for i: uint256 in range(256):
        if i >= ln: break
        lp[i] = arr[left + i]
    for i: uint256 in range(256):
        if i >= rn: break
        rp[i] = arr[mid + 1 + i]
    i: uint256 = 0
    j: uint256 = 0
    k: uint256 = left
    for _: uint256 in range(512):
        if i >= ln or j >= rn: break
        if lp[i] <= rp[j]:
            arr[k] = lp[i]; i += 1
        else:
            arr[k] = rp[j]; j += 1
        k += 1
    for _: uint256 in range(256):
        if i >= ln: break
        arr[k] = lp[i]; i += 1; k += 1
    for _: uint256 in range(256):
        if j >= rn: break
        arr[k] = rp[j]; j += 1; k += 1
    return arr

@external
def timsort(input_arr: uint256[9]) -> uint256[9]:
    arr: uint256[256] = empty(uint256[256])
    for i: uint256 in range(9):
        arr[i] = input_arr[i]
    n: uint256 = 9
    i: uint256 = 0
    for _: uint256 in range(32):
        if i >= n: break
        right: uint256 = i + MIN_RUN - 1
        if right >= n: right = n - 1
        arr = self.insertion_sort(arr, i, right)
        i += MIN_RUN
    size: uint256 = MIN_RUN
    for _: uint256 in range(8):
        if size >= n: break
        left: uint256 = 0
        for __: uint256 in range(32):
            if left >= n: break
            mid: uint256 = left + size - 1
            if mid >= n: mid = n - 1
            right: uint256 = left + 2 * size - 1
            if right >= n: right = n - 1
            if mid < right:
                arr = self.merge(arr, left, mid, right)
            left += 2 * size
        size *= 2
    result: uint256[9] = empty(uint256[9])
    for i: uint256 in range(9):
        result[i] = arr[i]
    return result
