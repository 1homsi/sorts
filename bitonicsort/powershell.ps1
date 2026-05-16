function Compare-And-Swap {
    param([ref]$arr, [int]$i, [int]$j, [bool]$direction)
    if ($direction -eq ($arr.Value[$i] -gt $arr.Value[$j])) {
        $tmp = $arr.Value[$i]
        $arr.Value[$i] = $arr.Value[$j]
        $arr.Value[$j] = $tmp
    }
}

function Bitonic-Merge {
    param([ref]$arr, [int]$lo, [int]$cnt, [bool]$direction)
    if ($cnt -gt 1) {
        $k = [int]($cnt / 2)
        for ($i = $lo; $i -lt $lo + $k; $i++) {
            Compare-And-Swap -arr $arr -i $i -j ($i + $k) -direction $direction
        }
        Bitonic-Merge -arr $arr -lo $lo -cnt $k -direction $direction
        Bitonic-Merge -arr $arr -lo ($lo + $k) -cnt $k -direction $direction
    }
}

function Bitonic-Sort {
    param([ref]$arr, [int]$lo, [int]$cnt, [bool]$direction)
    if ($cnt -gt 1) {
        $k = [int]($cnt / 2)
        Bitonic-Sort -arr $arr -lo $lo -cnt $k -direction $true
        Bitonic-Sort -arr $arr -lo ($lo + $k) -cnt $k -direction $false
        Bitonic-Merge -arr $arr -lo $lo -cnt $cnt -direction $direction
    }
}

$data = @(3, 7, 4, 8, 6, 2, 1, 5)
Bitonic-Sort -arr ([ref]$data) -lo 0 -cnt $data.Length -direction $true
Write-Output ($data -join ' ')
