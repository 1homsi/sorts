function Heapify {
    param([int[]]$arr, [int]$n, [int]$i)
    $largest = $i
    $left = 2 * $i + 1
    $right = 2 * $i + 2
    if ($left -lt $n -and $arr[$left] -gt $arr[$largest]) { $largest = $left }
    if ($right -lt $n -and $arr[$right] -gt $arr[$largest]) { $largest = $right }
    if ($largest -ne $i) {
        $tmp = $arr[$i]; $arr[$i] = $arr[$largest]; $arr[$largest] = $tmp
        Heapify $arr $n $largest
    }
}

function Heapsort {
    param([int[]]$arr)
    $n = $arr.Length
    for ($i = [math]::Floor($n / 2) - 1; $i -ge 0; $i--) { Heapify $arr $n $i }
    for ($i = $n - 1; $i -gt 0; $i--) {
        $tmp = $arr[0]; $arr[0] = $arr[$i]; $arr[$i] = $tmp
        Heapify $arr $i 0
    }
    return $arr
}

$arr = @(12, 11, 13, 5, 6, 7)
$result = Heapsort $arr
Write-Output ($result -join " ")
