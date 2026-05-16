fn cycle_sort(inout arr: DynamicVector[Int]) -> Int:
    var writes = 0
    let n = len(arr)
    for cycle_start in range(n - 1):
        var item = arr[cycle_start]
        var pos = cycle_start
        for i in range(cycle_start + 1, n):
            if arr[i] < item:
                pos += 1
        if pos == cycle_start:
            continue
        while item == arr[pos]:
            pos += 1
        let tmp = arr[pos]
        arr[pos] = item
        item = tmp
        writes += 1
        while pos != cycle_start:
            pos = cycle_start
            for i in range(cycle_start + 1, n):
                if arr[i] < item:
                    pos += 1
            while item == arr[pos]:
                pos += 1
            let t = arr[pos]
            arr[pos] = item
            item = t
            writes += 1
    return writes

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(5)
    arr.push_back(4)
    arr.push_back(3)
    arr.push_back(2)
    arr.push_back(1)
    _ = cycle_sort(arr)
    print(arr)
