$MIN_RUN = 32

function InsertionSort([int[]]$arr, [int]$left, [int]$right) {
    for ($i = $left + 1; $i -le $right; $i++) {
        $key = $arr[$i]
        $j = $i - 1
        while ($j -ge $left -and $arr[$j] -gt $key) {
            $arr[$j + 1] = $arr[$j]
            $j--
        }
        $arr[$j + 1] = $key
    }
    return $arr
}

function MergeRuns([int[]]$arr, [int]$left, [int]$mid, [int]$right) {
    $lp = $arr[$left..$mid]
    $rp = $arr[($mid+1)..$right]
    $i = 0; $j = 0; $k = $left
    while ($i -lt $lp.Count -and $j -lt $rp.Count) {
        if ($lp[$i] -le $rp[$j]) { $arr[$k++] = $lp[$i++] }
        else { $arr[$k++] = $rp[$j++] }
    }
    while ($i -lt $lp.Count) { $arr[$k++] = $lp[$i++] }
    while ($j -lt $rp.Count) { $arr[$k++] = $rp[$j++] }
    return $arr
}

function Timsort([int[]]$arr) {
    $n = $arr.Count
    $i = 0
    while ($i -lt $n) {
        $right = [Math]::Min($i + $MIN_RUN - 1, $n - 1)
        $arr = InsertionSort $arr $i $right
        $i += $MIN_RUN
    }
    $size = $MIN_RUN
    while ($size -lt $n) {
        $left = 0
        while ($left -lt $n) {
            $mid = [Math]::Min($left + $size - 1, $n - 1)
            $right = [Math]::Min($left + 2 * $size - 1, $n - 1)
            if ($mid -lt $right) { $arr = MergeRuns $arr $left $mid $right }
            $left += 2 * $size
        }
        $size *= 2
    }
    return $arr
}

$arr = @(5, 2, 8, 1, 9, 3, 7, 4, 6)
$sorted = Timsort $arr
Write-Output ($sorted -join ", ")
