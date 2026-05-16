[indent=4]
def counting_sort(arr: array of int): array of int
    n: int = arr.length
    if n == 0
        return arr
    min_val: int = arr[0]
    max_val: int = arr[0]
    for v in arr
        if v < min_val then min_val = v
        if v > max_val then max_val = v
    range_val: int = max_val - min_val + 1
    count: array of int = new array of int[range_val]
    for v in arr
        count[v - min_val]++
    for i: int = 1 to range_val - 1
        count[i] += count[i - 1]
    output: array of int = new array of int[n]
    for i: int = n - 1 downto 0
        count[arr[i] - min_val]--
        output[count[arr[i] - min_val]] = arr[i]
    return output

init
    arr: array of int = {4, 2, 2, 8, 3, 3, 1}
    result: array of int = counting_sort(arr)
    for v in result
        stdout.printf("%d ", v)
    print ""
