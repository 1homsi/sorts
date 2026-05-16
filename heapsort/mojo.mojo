fn heapify(inout arr: DynamicVector[Int], n: Int, i: Int):
    var largest = i
    var left = 2 * i + 1
    var right = 2 * i + 2
    if left < n and arr[left] > arr[largest]:
        largest = left
    if right < n and arr[right] > arr[largest]:
        largest = right
    if largest != i:
        var tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify(arr, n, largest)

fn heapsort(inout arr: DynamicVector[Int]):
    var n = len(arr)
    var i = n // 2 - 1
    while i >= 0:
        heapify(arr, n, i)
        i -= 1
    i = n - 1
    while i > 0:
        var tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify(arr, i, 0)
        i -= 1

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(12)
    arr.push_back(11)
    arr.push_back(13)
    arr.push_back(5)
    arr.push_back(6)
    arr.push_back(7)
    heapsort(arr)
    print(arr)
