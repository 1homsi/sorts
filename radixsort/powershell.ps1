function Invoke-CountingSort {
    param([int[]]$arr, [int]$exp)
    $n = $arr.Length
    $output = @(0) * $n
    $count = @(0) * 10
    foreach ($x in $arr) { $count[[int]($x / $exp) % 10]++ }
    for ($i = 1; $i -lt 10; $i++) { $count[$i] += $count[$i - 1] }
    for ($i = $n - 1; $i -ge 0; $i--) {
        $idx = [int]($arr[$i] / $exp) % 10
        $count[$idx]--
        $output[$count[$idx]] = $arr[$i]
    }
    for ($i = 0; $i -lt $n; $i++) { $arr[$i] = $output[$i] }
    return $arr
}

function Invoke-RadixSort {
    param([int[]]$arr)
    if ($arr.Length -eq 0) { return $arr }
    $max = ($arr | Measure-Object -Maximum).Maximum
    $exp = 1
    while ([int]($max / $exp) -gt 0) {
        $arr = Invoke-CountingSort -arr $arr -exp $exp
        $exp *= 10
    }
    return $arr
}

$arr = @(170, 45, 75, 90, 802, 24, 2, 66)
Write-Output (Invoke-RadixSort -arr $arr)
