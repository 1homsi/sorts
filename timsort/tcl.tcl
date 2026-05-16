set MIN_RUN 32

proc insertion_sort {arr left right} {
    for {set i [expr {$left + 1}]} {$i <= $right} {incr i} {
        set key [lindex $arr $i]
        set j [expr {$i - 1}]
        while {$j >= $left && [lindex $arr $j] > $key} {
            lset arr [expr {$j + 1}] [lindex $arr $j]
            incr j -1
        }
        lset arr [expr {$j + 1}] $key
    }
    return $arr
}

proc merge_runs {arr left mid right} {
    set lp [lrange $arr $left $mid]
    set rp [lrange $arr [expr {$mid + 1}] $right]
    set i 0; set j 0; set k $left
    while {$i < [llength $lp] && $j < [llength $rp]} {
        if {[lindex $lp $i] <= [lindex $rp $j]} {
            lset arr $k [lindex $lp $i]; incr i
        } else {
            lset arr $k [lindex $rp $j]; incr j
        }
        incr k
    }
    while {$i < [llength $lp]} { lset arr $k [lindex $lp $i]; incr i; incr k }
    while {$j < [llength $rp]} { lset arr $k [lindex $rp $j]; incr j; incr k }
    return $arr
}

proc timsort {arr} {
    global MIN_RUN
    set n [llength $arr]
    set i 0
    while {$i < $n} {
        set right [expr {min($i + $MIN_RUN - 1, $n - 1)}]
        set arr [insertion_sort $arr $i $right]
        incr i $MIN_RUN
    }
    set size $MIN_RUN
    while {$size < $n} {
        set left 0
        while {$left < $n} {
            set mid [expr {min($left + $size - 1, $n - 1)}]
            set right [expr {min($left + 2 * $size - 1, $n - 1)}]
            if {$mid < $right} { set arr [merge_runs $arr $left $mid $right] }
            incr left [expr {2 * $size}]
        }
        set size [expr {$size * 2}]
    }
    return $arr
}

set arr {5 2 8 1 9 3 7 4 6}
puts [timsort $arr]
