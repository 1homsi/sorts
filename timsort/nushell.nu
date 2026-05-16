def insertion-sort [arr: list<int>, left: int, right: int] -> list<int> {
    mut a = $arr
    mut i = $left + 1
    while $i <= $right {
        let key = $a | get $i
        mut j = $i - 1
        while $j >= $left and ($a | get $j) > $key {
            let jv = $a | get $j
            $a = $a | update ($j + 1) $jv
            $j = $j - 1
        }
        $a = $a | update ($j + 1) $key
        $i = $i + 1
    }
    $a
}

def merge-runs [arr: list<int>, left: int, mid: int, right: int] -> list<int> {
    mut a = $arr
    let lp = $a | slice $left..$mid
    let rp = $a | slice ($mid + 1)..$right
    mut i = 0
    mut j = 0
    mut k = $left
    let ln = $lp | length
    let rn = $rp | length
    while $i < $ln and $j < $rn {
        if ($lp | get $i) <= ($rp | get $j) {
            $a = $a | update $k ($lp | get $i)
            $i = $i + 1
        } else {
            $a = $a | update $k ($rp | get $j)
            $j = $j + 1
        }
        $k = $k + 1
    }
    while $i < $ln {
        $a = $a | update $k ($lp | get $i)
        $i = $i + 1
        $k = $k + 1
    }
    while $j < $rn {
        $a = $a | update $k ($rp | get $j)
        $j = $j + 1
        $k = $k + 1
    }
    $a
}

def timsort [arr: list<int>] -> list<int> {
    let min_run = 32
    mut a = $arr
    let n = $a | length
    mut i = 0
    while $i < $n {
        let right = if ($i + $min_run - 1) < $n { $i + $min_run - 1 } else { $n - 1 }
        $a = insertion-sort $a $i $right
        $i = $i + $min_run
    }
    mut size = $min_run
    while $size < $n {
        mut left = 0
        while $left < $n {
            let mid = if ($left + $size - 1) < $n { $left + $size - 1 } else { $n - 1 }
            let right = if ($left + 2 * $size - 1) < $n { $left + 2 * $size - 1 } else { $n - 1 }
            if $mid < $right { $a = merge-runs $a $left $mid $right }
            $left = $left + 2 * $size
        }
        $size = $size * 2
    }
    $a
}

let result = timsort [5, 2, 8, 1, 9, 3, 7, 4, 6]
print ($result | str join " ")
