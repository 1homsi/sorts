function BubbleSort($arr) {
    $n = $arr.Count
    do {
        $swapped = $false
        for ($i = 0; $i -lt $n - 1; $i++) {
            if ($arr[$i] -gt $arr[$i + 1]) {
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + 1]
                $arr[$i + 1] = $tmp
                $swapped = $true
            }
        }
        $n--
    } while ($swapped)
    return $arr
}

$arr = @(64, 34, 25, 12, 22, 11, 90)
$sorted = BubbleSort $arr
Write-Output ($sorted -join " ")
