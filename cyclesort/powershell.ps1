function Invoke-CycleSort {
    param([int[]]$arr)
    $n = $arr.Length
    $writes = 0
    for ($cycleStart = 0; $cycleStart -lt $n - 1; $cycleStart++) {
        $item = $arr[$cycleStart]
        $pos = $cycleStart
        for ($i = $cycleStart + 1; $i -lt $n; $i++) {
            if ($arr[$i] -lt $item) { $pos++ }
        }
        if ($pos -eq $cycleStart) { continue }
        while ($item -eq $arr[$pos]) { $pos++ }
        $tmp = $arr[$pos]; $arr[$pos] = $item; $item = $tmp
        $writes++
        while ($pos -ne $cycleStart) {
            $pos = $cycleStart
            for ($i = $cycleStart + 1; $i -lt $n; $i++) {
                if ($arr[$i] -lt $item) { $pos++ }
            }
            while ($item -eq $arr[$pos]) { $pos++ }
            $tmp = $arr[$pos]; $arr[$pos] = $item; $item = $tmp
            $writes++
        }
    }
    return $arr
}

$arr = @(5, 4, 3, 2, 1)
$sorted = Invoke-CycleSort -arr $arr
Write-Output ($sorted -join " ")
