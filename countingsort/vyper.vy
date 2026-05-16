# @version ^0.3.0

MAX_SIZE: constant(uint256) = 100

@internal
@pure
def counting_sort(arr: DynArray[uint256, MAX_SIZE], n: uint256) -> DynArray[uint256, MAX_SIZE]:
    if n == 0:
        return arr
    min_val: uint256 = arr[0]
    max_val: uint256 = arr[0]
    for i: uint256 in range(MAX_SIZE):
        if i >= n:
            break
        if arr[i] < min_val:
            min_val = arr[i]
        if arr[i] > max_val:
            max_val = arr[i]
    range_val: uint256 = max_val - min_val + 1
    count: DynArray[uint256, MAX_SIZE] = []
    for i: uint256 in range(MAX_SIZE):
        if i >= range_val:
            break
        count.append(0)
    for i: uint256 in range(MAX_SIZE):
        if i >= n:
            break
        idx: uint256 = arr[i] - min_val
        count[idx] += 1
    return arr

@external
@view
def run() -> DynArray[uint256, MAX_SIZE]:
    arr: DynArray[uint256, MAX_SIZE] = [4, 2, 2, 8, 3, 3, 1]
    return self.counting_sort(arr, 7)
