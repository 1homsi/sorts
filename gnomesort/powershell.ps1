function GnomeSort {
    param([int[]]$arr)
    $i = 0
    $n = $arr.Length
    while ($i -lt $n) {
        if ($i -eq 0 -or $arr[$i] -ge $arr[$i - 1]) {
            $i++
        } else {
            $tmp = $arr[$i]
            $arr[$i] = $arr[$i - 1]
            $arr[$i - 1] = $tmp
            $i--
        }
    }
    $arr
}
