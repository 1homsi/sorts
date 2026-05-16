def heapsort(arr):
    n = len(arr)
    for i in range(n // 2 - 1, -1, -1):
        siftdown(arr, i, n)
    for i in range(n - 1, 0, -1):
        temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        siftdown(arr, 0, i)

def siftdown(arr, idx, n):
    largest = idx
    left = 2 * idx + 1
    right = 2 * idx + 2
    if left < n and arr[left] > arr[largest]:
        largest = left
    if right < n and arr[right] > arr[largest]:
        largest = right
    if largest != idx:
        temp = arr[idx]
        arr[idx] = arr[largest]
        arr[largest] = temp
        siftdown(arr, largest, n)

arr = [5, 2, 8, 1, 9, 3]
heapsort(arr)
print(arr)
