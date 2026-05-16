proc gnomeSort {arr} {
    set n [llength $arr]
    set i 0
    while {$i < $n} {
        if {$i == 0 || [lindex $arr $i] >= [lindex $arr [expr {$i - 1}]]} {
            incr i
        } else {
            set tmp [lindex $arr $i]
            lset arr $i [lindex $arr [expr {$i - 1}]]
            lset arr [expr {$i - 1}] $tmp
            incr i -1
        }
    }
    return $arr
}
