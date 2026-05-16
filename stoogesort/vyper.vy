# @version 0.3.7

arr: int128[8]

@internal
def stooge_sort(first: uint256, last: uint256):
    if self.arr[first] > self.arr[last]:
        tmp: int128 = self.arr[first]
        self.arr[first] = self.arr[last]
        self.arr[last] = tmp
    n: uint256 = last - first + 1
    if n > 2:
        t: uint256 = n * 2 / 3
        self.stooge_sort(first, first + t - 1)
        self.stooge_sort(last - t + 1, last)
        self.stooge_sort(first, first + t - 1)

@external
def sort() -> int128[8]:
    self.arr = [3, 1, 4, 1, 5, 9, 2, 6]
    self.stooge_sort(0, 7)
    return self.arr
