MAX_LEN: constant(uint256) = 64

@internal
@pure
def _merge(left: DynArray[int128, MAX_LEN], right: DynArray[int128, MAX_LEN]) -> DynArray[int128, MAX_LEN]:
    result: DynArray[int128, MAX_LEN] = []
    i: uint256 = 0
    j: uint256 = 0
    for _ in range(MAX_LEN):
        if i >= len(left) or j >= len(right):
            break
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    for k in range(MAX_LEN):
        if i + k >= len(left):
            break
        result.append(left[i + k])
    for k in range(MAX_LEN):
        if j + k >= len(right):
            break
        result.append(right[j + k])
    return result

@external
@pure
def mergeSort(arr: DynArray[int128, MAX_LEN]) -> DynArray[int128, MAX_LEN]:
    if len(arr) <= 1:
        return arr
    mid: uint256 = len(arr) / 2
    left: DynArray[int128, MAX_LEN] = []
    right: DynArray[int128, MAX_LEN] = []
    for i in range(MAX_LEN):
        if i >= len(arr):
            break
        if i < mid:
            left.append(arr[i])
        else:
            right.append(arr[i])
    return self._merge(self.mergeSort(left), self.mergeSort(right))
