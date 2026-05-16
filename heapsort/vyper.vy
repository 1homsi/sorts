# @version ^0.3.0

arr: int128[6]

@internal
def heapify(n: int128, i: int128):
    largest: int128 = i
    left: int128 = 2 * i + 1
    right: int128 = 2 * i + 2
    if left < n and self.arr[left] > self.arr[largest]:
        largest = left
    if right < n and self.arr[right] > self.arr[largest]:
        largest = right
    if largest != i:
        tmp: int128 = self.arr[i]
        self.arr[i] = self.arr[largest]
        self.arr[largest] = tmp
        self.heapify(n, largest)

@external
def heapsort():
    self.arr[0] = 12
    self.arr[1] = 11
    self.arr[2] = 13
    self.arr[3] = 5
    self.arr[4] = 6
    self.arr[5] = 7
    n: int128 = 6
    for i: int128 in range(n / 2 - 1, -1, -1):
        self.heapify(n, i)
    for i: int128 in range(n - 1, 0, -1):
        tmp: int128 = self.arr[0]
        self.arr[0] = self.arr[i]
        self.arr[i] = tmp
        self.heapify(i, 0)
