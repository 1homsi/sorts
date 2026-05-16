fn get-digit {|x exp|
    put (% (// $x $exp) 10)
}

fn counting-sort {|arr exp|
    var result = []
    for d [(range 10)] {
        for x $arr {
            if (== (get-digit $x $exp) $d) {
                set result = [$@result $x]
            }
        }
    }
    put $result
}

fn radix-sort {|arr|
    if (== (count $arr) 0) {
        put $arr
        return
    }
    var max-val = $arr[0]
    for x $arr {
        if (> $x $max-val) { set max-val = $x }
    }
    var exp = 1
    var result = $arr
    while (> (// $max-val $exp) 0) {
        set result = (counting-sort $result $exp)
        set exp = (* $exp 10)
    }
    put $result
}

var arr = [170 45 75 90 802 24 2 66]
echo (radix-sort $arr)
