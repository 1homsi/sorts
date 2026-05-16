proc merge {left right} {
    set result {}
    set i 0
    set j 0
    while {$i < [llength $left] && $j < [llength $right]} {
        if {[lindex $left $i] <= [lindex $right $j]} {
            lappend result [lindex $left $i]
            incr i
        } else {
            lappend result [lindex $right $j]
            incr j
        }
    }
    while {$i < [llength $left]} {
        lappend result [lindex $left $i]
        incr i
    }
    while {$j < [llength $right]} {
        lappend result [lindex $right $j]
        incr j
    }
    return $result
}

proc mergesort {arr} {
    set n [llength $arr]
    if {$n <= 1} { return $arr }
    set mid [expr {$n / 2}]
    set left [mergesort [lrange $arr 0 [expr {$mid - 1}]]]
    set right [mergesort [lrange $arr $mid end]]
    return [merge $left $right]
}

set arr {38 27 43 3 9 82 10}
puts [mergesort $arr]
