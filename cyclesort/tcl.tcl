proc cycleSort {arr} {
    set n [llength $arr]
    set writes 0
    for {set cycleStart 0} {$cycleStart < $n - 1} {incr cycleStart} {
        set item [lindex $arr $cycleStart]
        set pos $cycleStart
        for {set i [expr {$cycleStart + 1}]} {$i < $n} {incr i} {
            if {[lindex $arr $i] < $item} {incr pos}
        }
        if {$pos == $cycleStart} continue
        while {$item == [lindex $arr $pos]} {incr pos}
        set tmp [lindex $arr $pos]
        lset arr $pos $item
        set item $tmp
        incr writes
        while {$pos != $cycleStart} {
            set pos $cycleStart
            for {set i [expr {$cycleStart + 1}]} {$i < $n} {incr i} {
                if {[lindex $arr $i] < $item} {incr pos}
            }
            while {$item == [lindex $arr $pos]} {incr pos}
            set tmp [lindex $arr $pos]
            lset arr $pos $item
            set item $tmp
            incr writes
        }
    }
    return $arr
}

set arr {5 4 3 2 1}
set result [cycleSort $arr]
puts $result
