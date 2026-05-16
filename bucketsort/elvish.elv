fn insertion-sort {|bucket|
    var n = (count $bucket)
    var arr = [$bucket[0..]]
    for i [(range 1 $n)] {
        var key = $arr[$i]
        var j = (- $i 1)
        while (and (>= $j 0) (> $arr[$j] $key)) {
            set arr[$j + 1] = $arr[$j]
            set j = (- $j 1)
        }
        set arr[$j + 1] = $key
    }
    put $arr[0..]
}

fn bucket-sort {|arr|
    var n = (count $arr)
    if (== $n 0) { put $arr; return }
    var min-v = $arr[0]
    var max-v = $arr[0]
    each {|v|
        if (< $v $min-v) { set min-v = $v }
        if (> $v $max-v) { set max-v = $v }
    } $arr
    var buckets = [(range $n | each {|_| put []})]
    each {|num|
        var idx = (exact-num (math:floor (* (/ (- $num $min-v) (+ (- $max-v $min-v) 1)) $n)))
        if (>= $idx $n) { set idx = (- $n 1) }
        set buckets[$idx] = [$buckets[$idx][0..] $num]
    } $arr
    var result = []
    each {|b|
        var sorted = [(insertion-sort $b)]
        set result = [$result[0..] $sorted[0..]]
    } $buckets
    put $result[0..]
}

var data = [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]
echo (bucket-sort $data)
