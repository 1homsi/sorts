fn stooge_sort(arr: DynamicVector[Int], first: Int, last: Int) -> DynamicVector[Int]:
    var a = arr
    if a[first] > a[last]:
        var tmp = a[first]
        a[first] = a[last]
        a[last] = tmp
    if last - first + 1 > 2:
        let t = (last - first + 1) * 2 // 3
        a = stooge_sort(a, first, first + t - 1)
        a = stooge_sort(a, last - t + 1, last)
        a = stooge_sort(a, first, first + t - 1)
    return a

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(3); arr.push_back(1); arr.push_back(4); arr.push_back(1)
    arr.push_back(5); arr.push_back(9); arr.push_back(2); arr.push_back(6)
    arr = stooge_sort(arr, 0, len(arr) - 1)
    print(arr)
