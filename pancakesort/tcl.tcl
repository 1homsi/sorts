proc flip {arrName k} {
    upvar $arrName arr
    set left 0
    set right $k
    while {$left < $right} {
        set tmp $arr($left)
        set arr($left) $arr($right)
        set arr($right) $tmp
        incr left
        incr right -1
    }
}

proc pancakeSort {lst} {
    set n [llength $lst]
    array set arr {}
    for {set i 0} {$i < $n} {incr i} {
        set arr($i) [lindex $lst $i]
    }
    set size $n
    while {$size > 1} {
        set maxIdx 0
        for {set i 1} {$i < $size} {incr i} {
            if {$arr($i) > $arr($maxIdx)} {set maxIdx $i}
        }
        if {$maxIdx != $size - 1} {
            if {$maxIdx != 0} {flip arr $maxIdx}
            flip arr [expr {$size - 1}]
        }
        incr size -1
    }
    set result {}
    for {set i 0} {$i < $n} {incr i} {
        lappend result $arr($i)
    }
    return $result
}

puts [pancakeSort {3 6 2 7 4 1 5}]
