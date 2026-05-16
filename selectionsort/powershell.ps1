function SelectionSort($arr) {
    $n = $arr.Length
    for ($i = 0; $i -lt $n; $i++) {
        $minIdx = $i
        for ($j = $i + 1; $j -lt $n; $j++) {
            if ($arr[$j] -lt $arr[$minIdx]) { $minIdx = $j }
        }
        $tmp = $arr[$i]; $arr[$i] = $arr[$minIdx]; $arr[$minIdx] = $tmp
    }
    return $arr
}
