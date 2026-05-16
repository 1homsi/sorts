fn selection-sort {|arr|
    var n = (count $arr)
    var result = $arr
    for i (range $n) {
        var min-idx = $i
        for j (range (+ $i 1) $n) {
            if (< $result[$j] $result[$min-idx]) {
                set min-idx = $j
            }
        }
        var tmp = $result[$i]
        set result[$i] = $result[$min-idx]
        set result[$min-idx] = $tmp
    }
    put $result
}
