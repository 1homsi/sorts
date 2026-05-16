var arr = [3 7 4 8 6 2 1 5]

fn compare-and-swap {|i j dir|
    var ai = $arr[$i]
    var aj = $arr[$j]
    if (or (and (eq $dir 1) (> $ai $aj)) (and (eq $dir 0) (< $ai $aj))) {
        set arr[$i] = $aj
        set arr[$j] = $ai
    }
}

fn bitonic-merge {|lo cnt dir|
    if (> $cnt 1) {
        var k = (/ $cnt 2)
        range $lo (+ $lo $k) | each {|i| compare-and-swap $i (+ $i $k) $dir}
        bitonic-merge $lo $k $dir
        bitonic-merge (+ $lo $k) $k $dir
    }
}

fn bitonic-sort {|lo cnt dir|
    if (> $cnt 1) {
        var k = (/ $cnt 2)
        bitonic-sort $lo $k 1
        bitonic-sort (+ $lo $k) $k 0
        bitonic-merge $lo $cnt $dir
    }
}

bitonic-sort 0 (count $arr) 1
echo $arr
