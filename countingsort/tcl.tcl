proc countingSort {arr} {
    set n [llength $arr]
    if {$n == 0} { return $arr }
    set min [lindex $arr 0]
    set max [lindex $arr 0]
    foreach v $arr {
        if {$v < $min} { set min $v }
        if {$v > $max} { set max $v }
    }
    set range [expr {$max - $min + 1}]
    set count [lrepeat $range 0]
    foreach v $arr {
        set i [expr {$v - $min}]
        lset count $i [expr {[lindex $count $i] + 1}]
    }
    for {set i 1} {$i < $range} {incr i} {
        lset count $i [expr {[lindex $count $i] + [lindex $count [expr {$i - 1}]]}]
    }
    set output [lrepeat $n 0]
    for {set i [expr {$n - 1}]} {$i >= 0} {incr i -1} {
        set v [lindex $arr $i]
        set idx [expr {$v - $min}]
        set pos [expr {[lindex $count $idx] - 1}]
        lset count $idx $pos
        lset output $pos $v
    }
    return $output
}

puts [countingSort {4 2 2 8 3 3 1}]
