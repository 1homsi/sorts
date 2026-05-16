fn cocktail-sort {|@arr|
    var n = (count $arr)
    var swapped = $true
    var start = 0
    var end = (- $n 1)
    while $swapped {
        set swapped = $false
        var i = $start
        while (< $i $end) {
            var a = $arr[$i]
            var b = $arr[(+ $i 1)]
            if (> $a $b) {
                set arr[$i] = $b
                set arr[(+ $i 1)] = $a
                set swapped = $true
            }
            set i = (+ $i 1)
        }
        if (not $swapped) { break }
        set swapped = $false
        set end = (- $end 1)
        set i = (- $end 1)
        while (>= $i $start) {
            var a = $arr[$i]
            var b = $arr[(+ $i 1)]
            if (> $a $b) {
                set arr[$i] = $b
                set arr[(+ $i 1)] = $a
                set swapped = $true
            }
            set i = (- $i 1)
        }
        set start = (+ $start 1)
    }
    put $arr[..]
}
