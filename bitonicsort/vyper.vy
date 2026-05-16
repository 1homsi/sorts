# @version ^0.3.0

MAX_SIZE: constant(uint256) = 256

@internal
def _compare_and_swap(arr: uint256[MAX_SIZE], i: uint256, j: uint256, direction: bool, size: uint256) -> uint256[MAX_SIZE]:
    result: uint256[MAX_SIZE] = arr
    if direction == (arr[i] > arr[j]):
        result[i] = arr[j]
        result[j] = arr[i]
    return result

@internal
def _bitonic_merge(arr: uint256[MAX_SIZE], lo: uint256, cnt: uint256, direction: bool) -> uint256[MAX_SIZE]:
    result: uint256[MAX_SIZE] = arr
    if cnt > 1:
        k: uint256 = cnt / 2
        for i: uint256 in range(MAX_SIZE):
            if i >= lo and i < lo + k:
                result = self._compare_and_swap(result, i, i + k, direction, MAX_SIZE)
    return result

@external
def sort(data: uint256[8]) -> uint256[8]:
    result: uint256[MAX_SIZE] = empty(uint256[MAX_SIZE])
    for i: uint256 in range(8):
        result[i] = data[i]
    out: uint256[8] = empty(uint256[8])
    for i: uint256 in range(8):
        out[i] = result[i]
    return out
