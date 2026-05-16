function InsertionSort([int[]]$arr) {
    $n = $arr.Length
    for ($i = 1; $i -lt $n; $i++) {
        $key = $arr[$i]
        $j = $i - 1
        while ($j -ge 0 -and $arr[$j] -gt $key) {
            $arr[$j + 1] = $arr[$j]
            $j--
        }
        $arr[$j + 1] = $key
    }
    return $arr
}
