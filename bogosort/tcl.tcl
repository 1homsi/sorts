proc isSorted {arr} {
    set n [llength $arr]
    for {set i 0} {$i < $n - 1} {incr i} {
        if {[lindex $arr $i] > [lindex $arr [expr {$i + 1}]]} {
            return 0
        }
    }
    return 1
}

proc shuffle {arr} {
    set n [llength $arr]
    for {set i [expr {$n - 1}]} {$i > 0} {incr i -1} {
        set j [expr {int(rand() * ($i + 1))}]
        set tmp [lindex $arr $i]
        lset arr $i [lindex $arr $j]
        lset arr $j $tmp
    }
    return $arr
}

proc bogosort {arr} {
    while {![isSorted $arr]} {
        set arr [shuffle $arr]
    }
    return $arr
}

set arr {3 1 4 1 5 9 2 6}
puts [bogosort $arr]
