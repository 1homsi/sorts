fn shell_sort(inout arr: DynamicVector[Int]):
    let n = len(arr)
    var gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            let temp = arr[i]
            var j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap //= 2

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(64)
    arr.push_back(34)
    arr.push_back(25)
    arr.push_back(12)
    arr.push_back(22)
    arr.push_back(11)
    arr.push_back(90)
    shell_sort(arr)
    for i in range(len(arr)):
        print(arr[i], end=" ")
    print()
