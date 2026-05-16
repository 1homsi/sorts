function CocktailSort($arr) {
    $swapped = $true
    $start = 0
    $end = $arr.Length - 1
    while ($swapped) {
        $swapped = $false
        for ($i = $start; $i -lt $end; $i++) {
            if ($arr[$i] -gt $arr[$i + 1]) {
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + 1]
                $arr[$i + 1] = $tmp
                $swapped = $true
            }
        }
        if (-not $swapped) { break }
        $swapped = $false
        $end--
        for ($i = $end - 1; $i -ge $start; $i--) {
            if ($arr[$i] -gt $arr[$i + 1]) {
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + 1]
                $arr[$i + 1] = $tmp
                $swapped = $true
            }
        }
        $start++
    }
    return $arr
}
