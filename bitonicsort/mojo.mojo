fn compare_and_swap(inout arr: DynamicVector[Int], i: Int, j: Int, direction: Bool):
    if direction == (arr[i] > arr[j]):
        let tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

fn bitonic_merge(inout arr: DynamicVector[Int], lo: Int, cnt: Int, direction: Bool):
    if cnt > 1:
        let k = cnt // 2
        for i in range(lo, lo + k):
            compare_and_swap(arr, i, i + k, direction)
        bitonic_merge(arr, lo, k, direction)
        bitonic_merge(arr, lo + k, k, direction)

fn bitonic_sort(inout arr: DynamicVector[Int], lo: Int, cnt: Int, direction: Bool):
    if cnt > 1:
        let k = cnt // 2
        bitonic_sort(arr, lo, k, True)
        bitonic_sort(arr, lo + k, k, False)
        bitonic_merge(arr, lo, cnt, direction)

fn main():
    var data = DynamicVector[Int]()
    data.push_back(3); data.push_back(7); data.push_back(4); data.push_back(8)
    data.push_back(6); data.push_back(2); data.push_back(1); data.push_back(5)
    bitonic_sort(data, 0, len(data), True)
    print(data)
