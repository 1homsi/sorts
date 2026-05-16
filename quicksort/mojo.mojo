fn partition(inout arr: DynamicVector[Int], low: Int, high: Int) -> Int:
    let pivot = arr[high]
    var i = low
    for j in range(low, high):
        if arr[j] <= pivot:
            let tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i += 1
    let tmp = arr[i]
    arr[i] = arr[high]
    arr[high] = tmp
    return i

fn quicksort(inout arr: DynamicVector[Int], low: Int, high: Int):
    if low < high:
        let p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(3)
    arr.push_back(6)
    arr.push_back(8)
    arr.push_back(10)
    arr.push_back(1)
    arr.push_back(2)
    arr.push_back(1)
    quicksort(arr, 0, len(arr) - 1)
    print(arr)
