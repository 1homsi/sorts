proc heapify {arrName n i} {
    upvar $arrName arr
    set largest $i
    set left [expr {2 * $i + 1}]
    set right [expr {2 * $i + 2}]
    if {$left < $n && $arr($left) > $arr($largest)} { set largest $left }
    if {$right < $n && $arr($right) > $arr($largest)} { set largest $right }
    if {$largest != $i} {
        set tmp $arr($i); set arr($i) $arr($largest); set arr($largest) $tmp
        heapify arr $n $largest
    }
}

proc heapsort {arrName} {
    upvar $arrName arr
    set n [array size arr]
    for {set i [expr {$n/2 - 1}]} {$i >= 0} {incr i -1} { heapify arr $n $i }
    for {set i [expr {$n - 1}]} {$i > 0} {incr i -1} {
        set tmp $arr(0); set arr(0) $arr($i); set arr($i) $tmp
        heapify arr $i 0
    }
}

array set data {0 12 1 11 2 13 3 5 4 6 5 7}
heapsort data
for {set i 0} {$i < 6} {incr i} { puts -nonewline "$data($i) " }
puts ""
