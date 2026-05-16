arr: int128[7]

@internal
def flip(k: uint256):
    left: uint256 = 0
    right: uint256 = k
    for _: uint256 in range(7):
        if left >= right:
            break
        tmp: int128 = self.arr[left]
        self.arr[left] = self.arr[right]
        self.arr[right] = tmp
        left += 1
        right -= 1

@internal
def pancake_sort():
    size: uint256 = 7
    for _: uint256 in range(7):
        if size <= 1:
            break
        max_idx: uint256 = 0
        for i: uint256 in range(7):
            if i >= size:
                break
            if self.arr[i] > self.arr[max_idx]:
                max_idx = i
        if max_idx != size - 1:
            if max_idx != 0:
                self.flip(max_idx)
            self.flip(size - 1)
        size -= 1

@external
def sort() -> int128[7]:
    self.arr = [3, 6, 2, 7, 4, 1, 5]
    self.pancake_sort()
    return self.arr
