function Invoke-StoogeSort {
    param([int[]]$arr, [int]$first, [int]$last)
    if ($arr[$first] -gt $arr[$last]) {
        $tmp = $arr[$first]
        $arr[$first] = $arr[$last]
        $arr[$last] = $tmp
    }
    if ($last - $first + 1 -gt 2) {
        $t = [int](($last - $first + 1) * 2 / 3)
        Invoke-StoogeSort $arr $first ($first + $t - 1)
        Invoke-StoogeSort $arr ($last - $t + 1) $last
        Invoke-StoogeSort $arr $first ($first + $t - 1)
    }
}

$arr = @(3, 1, 4, 1, 5, 9, 2, 6)
Invoke-StoogeSort $arr 0 ($arr.Length - 1)
Write-Output $arr
