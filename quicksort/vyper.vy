MAX_SIZE: constant(uint256) = 100

arr: int128[MAX_SIZE]

@internal
def _partition(low: uint256, high: uint256) -> uint256:
    pivot: int128 = self.arr[high]
    i: uint256 = low
    for j: uint256 in range(low, high, bound=MAX_SIZE):
        if self.arr[j] <= pivot:
            temp: int128 = self.arr[i]
            self.arr[i] = self.arr[j]
            self.arr[j] = temp
            i += 1
    temp: int128 = self.arr[i]
    self.arr[i] = self.arr[high]
    self.arr[high] = temp
    return i

@internal
def _quicksort(low: uint256, high: uint256):
    if low < high:
        p: uint256 = self._partition(low, high)
        if p > 0:
            self._quicksort(low, p - 1)
        self._quicksort(p + 1, high)

@external
def sort(n: uint256):
    self._quicksort(0, n - 1)
