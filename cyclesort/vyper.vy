# @version ^0.3.0

MAX_SIZE: constant(uint256) = 100

@internal
def _cycle_sort(arr: uint256[5]) -> uint256[5]:
    n: uint256 = 5
    result: uint256[5] = arr
    for cycle_start in range(4):
        item: uint256 = result[cycle_start]
        pos: uint256 = cycle_start
        for i in range(5):
            if i > cycle_start and result[i] < item:
                pos += 1
        if pos == cycle_start:
            continue
        for _skip in range(5):
            if result[pos] != item:
                break
            pos += 1
        tmp: uint256 = result[pos]
        result[pos] = item
        item = tmp
    return result

@external
def sort(arr: uint256[5]) -> uint256[5]:
    return self._cycle_sort(arr)
