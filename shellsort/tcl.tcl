proc shellSort {arr} {
    set n [llength $arr]
    set gap [expr {$n / 2}]
    while {$gap > 0} {
        for {set i $gap} {$i < $n} {incr i} {
            set temp [lindex $arr $i]
            set j $i
            while {$j >= $gap && [lindex $arr [expr {$j - $gap}]] > $temp} {
                lset arr $j [lindex $arr [expr {$j - $gap}]]
                incr j -$gap
            }
            lset arr $j $temp
        }
        set gap [expr {$gap / 2}]
    }
    return $arr
}

set arr {64 34 25 12 22 11 90}
puts [shellSort $arr]
