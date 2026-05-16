proc stoogeSort {arr first last} {
    upvar $arr a
    if {$a($first) > $a($last)} {
        set tmp $a($first)
        set a($first) $a($last)
        set a($last) $tmp
    }
    set n [expr {$last - $first + 1}]
    if {$n > 2} {
        set t [expr {$n * 2 / 3}]
        stoogeSort a $first [expr {$first + $t - 1}]
        stoogeSort a [expr {$last - $t + 1}] $last
        stoogeSort a $first [expr {$first + $t - 1}]
    }
}

set arr(0) 3; set arr(1) 1; set arr(2) 4; set arr(3) 1
set arr(4) 5; set arr(5) 9; set arr(6) 2; set arr(7) 6
stoogeSort arr 0 7
for {set i 0} {$i < 8} {incr i} { puts -nonewline "$arr($i) " }
puts ""
