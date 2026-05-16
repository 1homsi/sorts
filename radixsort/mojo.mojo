from memory import memcpy

fn counting_sort(inout arr: DynamicVector[Int], exp: Int):
    let n = len(arr)
    var output = DynamicVector[Int]()
    for _ in range(n):
        output.append(0)
    var count = DynamicVector[Int]()
    for _ in range(10):
        count.append(0)
    for i in range(n):
        count[(arr[i] // exp) % 10] += 1
    for i in range(1, 10):
        count[i] += count[i - 1]
    for i in range(n - 1, -1, -1):
        let idx = (arr[i] // exp) % 10
        count[idx] -= 1
        output[count[idx]] = arr[i]
    for i in range(n):
        arr[i] = output[i]

fn radix_sort(inout arr: DynamicVector[Int]):
    if len(arr) == 0:
        return
    var max_val = arr[0]
    for i in range(len(arr)):
        if arr[i] > max_val:
            max_val = arr[i]
    var exp = 1
    while max_val // exp > 0:
        counting_sort(arr, exp)
        exp *= 10

fn main():
    var arr = DynamicVector[Int]()
    for x in [170, 45, 75, 90, 802, 24, 2, 66]:
        arr.append(x)
    radix_sort(arr)
    print(arr)
