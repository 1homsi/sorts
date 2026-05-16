function Test-Sorted($arr) {
    for ($i = 0; $i -lt $arr.Count - 1; $i++) {
        if ($arr[$i] -gt $arr[$i + 1]) { return $false }
    }
    return $true
}

function Invoke-Shuffle($arr) {
    $arr = $arr.Clone()
    $n = $arr.Count
    for ($i = $n - 1; $i -gt 0; $i--) {
        $j = Get-Random -Maximum ($i + 1)
        $tmp = $arr[$i]
        $arr[$i] = $arr[$j]
        $arr[$j] = $tmp
    }
    return $arr
}

function Invoke-Bogosort($arr) {
    while (-not (Test-Sorted $arr)) {
        $arr = Invoke-Shuffle $arr
    }
    return $arr
}

$arr = @(3, 1, 4, 1, 5, 9, 2, 6)
Write-Output (Invoke-Bogosort $arr)
