fn flip(inout arr: DynamicVector[Int], k: Int):
    var left = 0
    var right = k
    while left < right:
        var tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left += 1
        right -= 1

fn pancake_sort(inout arr: DynamicVector[Int]):
    var size = len(arr)
    while size > 1:
        var max_idx = 0
        for i in range(1, size):
            if arr[i] > arr[max_idx]:
                max_idx = i
        if max_idx != size - 1:
            if max_idx != 0:
                flip(arr, max_idx)
            flip(arr, size - 1)
        size -= 1

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(3)
    arr.push_back(6)
    arr.push_back(2)
    arr.push_back(7)
    arr.push_back(4)
    arr.push_back(1)
    arr.push_back(5)
    pancake_sort(arr)
    print(arr)
