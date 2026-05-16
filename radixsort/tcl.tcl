proc counting_sort {arr exp} {
    set n [llength $arr]
    set output [lrepeat $n 0]
    set count [lrepeat 10 0]
    foreach x $arr {
        set idx [expr {($x / $exp) % 10}]
        lset count $idx [expr {[lindex $count $idx] + 1}]
    }
    for {set i 1} {$i < 10} {incr i} {
        lset count $i [expr {[lindex $count $i] + [lindex $count [expr {$i-1}]]}]
    }
    for {set i [expr {$n-1}]} {$i >= 0} {incr i -1} {
        set x [lindex $arr $i]
        set idx [expr {($x / $exp) % 10}]
        set pos [expr {[lindex $count $idx] - 1}]
        lset count $idx $pos
        lset output $pos $x
    }
    return $output
}

proc radix_sort {arr} {
    if {[llength $arr] == 0} { return $arr }
    set max [lindex [lsort -integer $arr] end]
    set exp 1
    while {$max / $exp > 0} {
        set arr [counting_sort $arr $exp]
        set exp [expr {$exp * 10}]
    }
    return $arr
}

puts [radix_sort {170 45 75 90 802 24 2 66}]
