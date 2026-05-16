proc insertion_sort {arr} {
    set n [llength $arr]
    for {set i 1} {$i < $n} {incr i} {
        set key [lindex $arr $i]
        set j [expr {$i - 1}]
        while {$j >= 0 && [lindex $arr $j] > $key} {
            lset arr [expr {$j + 1}] [lindex $arr $j]
            incr j -1
        }
        lset arr [expr {$j + 1}] $key
    }
    return $arr
}
