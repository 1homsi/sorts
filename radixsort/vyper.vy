MAX_LEN: constant(uint256) = 8

@internal
def counting_sort(arr: uint256[MAX_LEN], exp: uint256) -> uint256[MAX_LEN]:
    output: uint256[MAX_LEN] = empty(uint256[MAX_LEN])
    count: uint256[10] = empty(uint256[10])
    for i: uint256 in range(MAX_LEN):
        idx: uint256 = (arr[i] / exp) % 10
        count[idx] += 1
    for i: uint256 in range(1, 10):
        count[i] += count[i - 1]
    for j: uint256 in range(MAX_LEN):
        i: uint256 = MAX_LEN - 1 - j
        idx: uint256 = (arr[i] / exp) % 10
        count[idx] -= 1
        output[count[idx]] = arr[i]
    return output

@external
def radix_sort(arr: uint256[MAX_LEN]) -> uint256[MAX_LEN]:
    result: uint256[MAX_LEN] = arr
    max_val: uint256 = arr[0]
    for i: uint256 in range(1, MAX_LEN):
        if arr[i] > max_val:
            max_val = arr[i]
    exp: uint256 = 1
    for _: uint256 in range(10):
        if max_val / exp == 0:
            break
        result = self.counting_sort(result, exp)
        exp *= 10
    return result
