[indent=4]
uses GLib

def counting_sort(arr: array of int, exp: int)
    n: int = arr.length
    output: array of int = new array of int[n]
    count: array of int = new array of int[10]
    for x in arr
        count[(x / exp) % 10]++
    for var i = 1 to 9
        count[i] += count[i - 1]
    for var i = n - 1 downto 0
        idx: int = (arr[i] / exp) % 10
        count[idx]--
        output[count[idx]] = arr[i]
    for var i = 0 to n - 1
        arr[i] = output[i]

def radix_sort(arr: array of int)
    if arr.length == 0 do return
    max: int = arr[0]
    for x in arr
        if x > max do max = x
    exp: int = 1
    while max / exp > 0
        counting_sort(arr, exp)
        exp *= 10

init
    arr: array of int = {170, 45, 75, 90, 802, 24, 2, 66}
    radix_sort(arr)
    for x in arr
        stdout.printf("%d ", x)
    stdout.printf("\n")
