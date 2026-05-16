proc combSort {arr} {
    set n [llength $arr]
    set gap $n
    set sorted 0
    while {!$sorted} {
        set gap [expr {int($gap / 1.3)}]
        if {$gap <= 1} {
            set gap 1
            set sorted 1
        }
        for {set i 0} {$i + $gap < $n} {incr i} {
            set j [expr {$i + $gap}]
            if {[lindex $arr $i] > [lindex $arr $j]} {
                set tmp [lindex $arr $i]
                lset arr $i [lindex $arr $j]
                lset arr $j $tmp
                set sorted 0
            }
        }
    }
    return $arr
}
