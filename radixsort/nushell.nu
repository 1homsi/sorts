def get-digit [x: int, exp: int] {
    ($x / $exp | math floor) mod 10
}

def counting-sort [arr: list<int>, exp: int] {
    0..9 | each { |d|
        $arr | where { |x| (get-digit $x $exp) == $d }
    } | flatten
}

def radix-sort [arr: list<int>] {
    if ($arr | length) == 0 { return $arr }
    let max-val = $arr | math max
    mut result = $arr
    mut exp = 1
    while ($max-val / $exp | math floor) > 0 {
        $result = (counting-sort $result $exp)
        $exp = $exp * 10
    }
    $result
}

radix-sort [170, 45, 75, 90, 802, 24, 2, 66]
