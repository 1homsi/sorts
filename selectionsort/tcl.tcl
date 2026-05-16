proc selectionSort {arr} {
    set n [llength $arr]
    for {set i 0} {$i < $n} {incr i} {
        set minIdx $i
        for {set j [expr {$i + 1}]} {$j < $n} {incr j} {
            if {[lindex $arr $j] < [lindex $arr $minIdx]} {
                set minIdx $j
            }
        }
        set tmp [lindex $arr $i]
        lset arr $i [lindex $arr $minIdx]
        lset arr $minIdx $tmp
    }
    return $arr
}
