proc bubbleSort {arr} {
    set n [llength $arr]
    set swapped 1
    while {$swapped} {
        set swapped 0
        for {set i 0} {$i < $n - 1} {incr i} {
            if {[lindex $arr $i] > [lindex $arr [expr {$i+1}]]} {
                set tmp [lindex $arr $i]
                lset arr $i [lindex $arr [expr {$i+1}]]
                lset arr [expr {$i+1}] $tmp
                set swapped 1
            }
        }
        incr n -1
    }
    return $arr
}

set arr {64 34 25 12 22 11 90}
puts [bubbleSort $arr]
