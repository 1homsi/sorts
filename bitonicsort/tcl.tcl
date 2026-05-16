proc compare_and_swap {arrName i j dir} {
    upvar $arrName arr
    if {$dir == ($arr($i) > $arr($j))} {
        set tmp $arr($i)
        set arr($i) $arr($j)
        set arr($j) $tmp
    }
}

proc bitonic_merge {arrName lo cnt dir} {
    upvar $arrName arr
    if {$cnt > 1} {
        set k [expr {$cnt / 2}]
        for {set i $lo} {$i < $lo + $k} {incr i} {
            compare_and_swap arr $i [expr {$i + $k}] $dir
        }
        bitonic_merge arr $lo $k $dir
        bitonic_merge arr [expr {$lo + $k}] $k $dir
    }
}

proc bitonic_sort {arrName lo cnt dir} {
    upvar $arrName arr
    if {$cnt > 1} {
        set k [expr {$cnt / 2}]
        bitonic_sort arr $lo $k 1
        bitonic_sort arr [expr {$lo + $k}] $k 0
        bitonic_merge arr $lo $cnt $dir
    }
}

array set data {0 3 1 7 2 4 3 8 4 6 5 2 6 1 7 5}
bitonic_sort data 0 8 1
for {set i 0} {$i < 8} {incr i} { puts -nonewline "$data($i) " }
puts ""
