var arr = [12 11 13 5 6 7]

fn heapify {|n i|
    var largest = $i
    var left = (* 2 $i | + 1)
    var right = (+ (* 2 $i) 2)
    if (and (< $left $n) (> $arr[$left] $arr[$largest])) { set largest = $left }
    if (and (< $right $n) (> $arr[$right] $arr[$largest])) { set largest = $right }
    if (not-eq $largest $i) {
        var tmp = $arr[$i]
        set arr[$i] = $arr[$largest]
        set arr[$largest] = $tmp
        heapify $n $largest
    }
}

fn heapsort {
    var n = (count $arr)
    var i = (- (/ $n 2) 1)
    while (>= $i 0) { heapify $n $i; set i = (- $i 1) }
    set i = (- $n 1)
    while (> $i 0) {
        var tmp = $arr[0]
        set arr[0] = $arr[$i]
        set arr[$i] = $tmp
        heapify $i 0
        set i = (- $i 1)
    }
}

heapsort
echo $arr
