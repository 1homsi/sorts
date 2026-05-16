function Invoke-CountingSort {
    param([int[]]$arr)
    if ($arr.Length -eq 0) { return $arr }
    $min = ($arr | Measure-Object -Minimum).Minimum
    $max = ($arr | Measure-Object -Maximum).Maximum
    $range = $max - $min + 1
    $count = @(0) * $range
    foreach ($v in $arr) { $count[$v - $min]++ }
    for ($i = 1; $i -lt $range; $i++) { $count[$i] += $count[$i - 1] }
    $output = @(0) * $arr.Length
    for ($i = $arr.Length - 1; $i -ge 0; $i--) {
        $count[$arr[$i] - $min]--
        $output[$count[$arr[$i] - $min]] = $arr[$i]
    }
    return $output
}

$arr = @(4, 2, 2, 8, 3, 3, 1)
Write-Output (Invoke-CountingSort $arr)
