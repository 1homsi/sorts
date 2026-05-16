function QuickSort($arr) {
    if ($arr.Count -le 1) { return $arr }
    $pivot = $arr[[Math]::Floor($arr.Count / 2)]
    $left = $arr | Where-Object { $_ -lt $pivot }
    $middle = $arr | Where-Object { $_ -eq $pivot }
    $right = $arr | Where-Object { $_ -gt $pivot }
    return @(QuickSort $left) + @($middle) + @(QuickSort $right)
}

$sorted = QuickSort @(3, 6, 8, 10, 1, 2, 1)
Write-Output ($sorted -join " ")
