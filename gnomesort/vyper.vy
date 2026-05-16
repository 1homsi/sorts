@external
def gnome_sort(arr: int128[100], n: uint256) -> int128[100]:
    i: uint256 = 0
    tmp: int128 = 0
    for _: uint256 in range(10000):
        if i >= n:
            break
        if i == 0 or arr[i] >= arr[i - 1]:
            i += 1
        else:
            tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i -= 1
    return arr
