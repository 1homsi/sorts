proc insertion_sort {bucket} {
    set n [llength $bucket]
    for {set i 1} {$i < $n} {incr i} {
        set key [lindex $bucket $i]
        set j [expr {$i - 1}]
        while {$j >= 0 && [lindex $bucket $j] > $key} {
            lset bucket [expr {$j + 1}] [lindex $bucket $j]
            incr j -1
        }
        lset bucket [expr {$j + 1}] $key
    }
    return $bucket
}

proc bucket_sort {arr} {
    set n [llength $arr]
    if {$n == 0} {return $arr}
    set minV [lindex $arr 0]
    set maxV [lindex $arr 0]
    foreach v $arr {
        if {$v < $minV} {set minV $v}
        if {$v > $maxV} {set maxV $v}
    }
    set buckets [lrepeat $n {}]
    foreach num $arr {
        set idx [expr {int(($num - $minV) / ($maxV - $minV + 1) * $n)}]
        if {$idx >= $n} {set idx [expr {$n - 1}]}
        lset buckets $idx [concat [lindex $buckets $idx] $num]
    }
    set result {}
    foreach bucket $buckets {
        set result [concat $result [insertion_sort $bucket]]
    }
    return $result
}

set data {0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68}
puts [bucket_sort $data]
