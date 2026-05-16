from python import Python

fn insertion_sort(inout arr: DynamicVector[Int], left: Int, right: Int):
    var i = left + 1
    while i <= right:
        let key = arr[i]
        var j = i - 1
        while j >= left and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
        i += 1

fn merge(inout arr: DynamicVector[Int], left: Int, mid: Int, right: Int):
    var lp = DynamicVector[Int]()
    var rp = DynamicVector[Int]()
    var k = left
    while k <= mid:
        lp.push_back(arr[k])
        k += 1
    k = mid + 1
    while k <= right:
        rp.push_back(arr[k])
        k += 1
    var i = 0
    var j = 0
    k = left
    while i < len(lp) and j < len(rp):
        if lp[i] <= rp[j]:
            arr[k] = lp[i]; i += 1
        else:
            arr[k] = rp[j]; j += 1
        k += 1
    while i < len(lp):
        arr[k] = lp[i]; i += 1; k += 1
    while j < len(rp):
        arr[k] = rp[j]; j += 1; k += 1

fn timsort(inout arr: DynamicVector[Int]):
    let n = len(arr)
    let min_run = 32
    var i = 0
    while i < n:
        let right = min(i + min_run - 1, n - 1)
        insertion_sort(arr, i, right)
        i += min_run
    var size = min_run
    while size < n:
        var left = 0
        while left < n:
            let mid = min(left + size - 1, n - 1)
            let right = min(left + 2 * size - 1, n - 1)
            if mid < right:
                merge(arr, left, mid, right)
            left += 2 * size
        size *= 2

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(5); arr.push_back(2); arr.push_back(8)
    arr.push_back(1); arr.push_back(9); arr.push_back(3)
    arr.push_back(7); arr.push_back(4); arr.push_back(6)
    timsort(arr)
    for i in range(len(arr)):
        print(arr[i], end=" ")
    print("")
