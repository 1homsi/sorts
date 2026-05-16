fn cycle-sort {|arr|
    var n = (count $arr)
    var writes = 0
    for cycle-start [(range (- $n 1))] {
        var item = $arr[$cycle-start]
        var pos = $cycle-start
        for i [(range (+ $cycle-start 1) $n)] {
            if (< $arr[$i] $item) {
                set pos = (+ $pos 1)
            }
        }
        if (not-eq $pos $cycle-start) {
            while (eq $arr[$pos] $item) {
                set pos = (+ $pos 1)
            }
            var tmp = $arr[$pos]
            set arr[$pos] = $item
            set item = $tmp
            set writes = (+ $writes 1)
            while (not-eq $pos $cycle-start) {
                set pos = $cycle-start
                for i [(range (+ $cycle-start 1) $n)] {
                    if (< $arr[$i] $item) {
                        set pos = (+ $pos 1)
                    }
                }
                while (eq $arr[$pos] $item) {
                    set pos = (+ $pos 1)
                }
                var t = $arr[$pos]
                set arr[$pos] = $item
                set item = $t
                set writes = (+ $writes 1)
            }
        }
    }
    put $arr
}

cycle-sort [5 4 3 2 1]
