function Merge-Arrays {
    param([array]$Left, [array]$Right)
    $result = @()
    $i = 0; $j = 0
    while ($i -lt $Left.Count -and $j -lt $Right.Count) {
        if ($Left[$i] -le $Right[$j]) {
            $result += $Left[$i++]
        } else {
            $result += $Right[$j++]
        }
    }
    while ($i -lt $Left.Count) { $result += $Left[$i++] }
    while ($j -lt $Right.Count) { $result += $Right[$j++] }
    return $result
}

function Invoke-MergeSort {
    param([array]$Arr)
    if ($Arr.Count -le 1) { return $Arr }
    $mid = [int]($Arr.Count / 2)
    $left = Invoke-MergeSort $Arr[0..($mid-1)]
    $right = Invoke-MergeSort $Arr[$mid..($Arr.Count-1)]
    return Merge-Arrays $left $right
}

$arr = @(38, 27, 43, 3, 9, 82, 10)
Write-Output (Invoke-MergeSort $arr)
