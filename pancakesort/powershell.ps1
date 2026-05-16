function Flip($arr, $k) {
    $left = 0; $right = $k
    while ($left -lt $right) {
        $tmp = $arr[$left]; $arr[$left] = $arr[$right]; $arr[$right] = $tmp
        $left++; $right--
    }
}

function PancakeSort($arr) {
    $size = $arr.Length
    while ($size -gt 1) {
        $maxIdx = 0
        for ($i = 1; $i -lt $size; $i++) {
            if ($arr[$i] -gt $arr[$maxIdx]) { $maxIdx = $i }
        }
        if ($maxIdx -ne $size - 1) {
            if ($maxIdx -ne 0) { Flip $arr $maxIdx }
            Flip $arr ($size - 1)
        }
        $size--
    }
    return $arr
}

$arr = @(3, 6, 2, 7, 4, 1, 5)
Write-Output (PancakeSort $arr)
