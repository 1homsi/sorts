proc cocktailSort {arr} {
    set n [llength $arr]
    set swapped 1
    set start 0
    set end [expr {$n - 1}]
    while {$swapped} {
        set swapped 0
        for {set i $start} {$i < $end} {incr i} {
            set a [lindex $arr $i]
            set b [lindex $arr [expr {$i + 1}]]
            if {$a > $b} {
                lset arr $i $b
                lset arr [expr {$i + 1}] $a
                set swapped 1
            }
        }
        if {!$swapped} break
        set swapped 0
        incr end -1
        for {set i [expr {$end - 1}]} {$i >= $start} {incr i -1} {
            set a [lindex $arr $i]
            set b [lindex $arr [expr {$i + 1}]]
            if {$a > $b} {
                lset arr $i $b
                lset arr [expr {$i + 1}] $a
                set swapped 1
            }
        }
        incr start
    }
    return $arr
}
