import core

fun heapsort(arr: Array[Int]) do
    var n = arr.length
    for i in [n / 2 - 1, 0, -1] do
        siftdown(arr, i, n)
    end
    for i in [n - 1, 1, -1] do
        var temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        siftdown(arr, 0, i)
    end
end

fun siftdown(arr: Array[Int], idx: Int, n: Int) do
    var largest = idx
    var left = 2 * idx + 1
    var right = 2 * idx + 2
    if left < n && arr[left] > arr[largest] then
        largest = left
    end
    if right < n && arr[right] > arr[largest] then
        largest = right
    end
    if largest != idx then
        var temp = arr[idx]
        arr[idx] = arr[largest]
        arr[largest] = temp
        siftdown(arr, largest, n)
    end
end

var arr = [5, 2, 8, 1, 9, 3]
heapsort(arr)
print(arr)
