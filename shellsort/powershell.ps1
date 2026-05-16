function Shellsort {
    param([array]$arr)
    $n = $arr.Length
    $gap = [math]::Floor($n / 2)
    while ($gap -gt 0) {
        for ($i = $gap; $i -lt $n; $i++) {
            $temp = $arr[$i]
            $j = $i
            while ($j -ge $gap -and $arr[$j - $gap] -gt $temp) {
                $arr[$j] = $arr[$j - $gap]
                $j -= $gap
            }
            $arr[$j] = $temp
        }
        $gap = [math]::Floor($gap / 2)
    }
    return $arr
}
