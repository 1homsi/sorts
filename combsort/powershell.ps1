function Invoke-CombSort {
    param([int[]]$arr)
    $n = $arr.Length
    $gap = $n
    $sorted = $false
    while (-not $sorted) {
        $gap = [int]($gap / 1.3)
        if ($gap -le 1) {
            $gap = 1
            $sorted = $true
        }
        for ($i = 0; $i + $gap -lt $n; $i++) {
            if ($arr[$i] -gt $arr[$i + $gap]) {
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + $gap]
                $arr[$i + $gap] = $tmp
                $sorted = $false
            }
        }
    }
    return $arr
}
