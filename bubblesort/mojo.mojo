fn bubble_sort(inout arr: DynamicVector[Int]):
    var n = len(arr)
    var swapped = True
    while swapped:
        swapped = False
        for i in range(n - 1):
            if arr[i] > arr[i + 1]:
                let tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = True
        n -= 1

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(64)
    arr.push_back(34)
    arr.push_back(25)
    arr.push_back(12)
    arr.push_back(22)
    arr.push_back(11)
    arr.push_back(90)
    bubble_sort(arr)
    for i in range(len(arr)):
        print(arr[i], end=" ")
    print()
