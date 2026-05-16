def heapify [arr: list<int>, n: int, i: int] -> list<int> {
    mut a = $arr
    mut largest = $i
    let left = 2 * $i + 1
    let right = 2 * $i + 2
    if $left < $n and ($a | get $left) > ($a | get $largest) { $largest = $left }
    if $right < $n and ($a | get $right) > ($a | get $largest) { $largest = $right }
    if $largest != $i {
        let tmp = $a | get $i
        let vl = $a | get $largest
        $a = $a | enumerate | each { if $in.index == $i { $vl } else if $in.index == $largest { $tmp } else { $in.item } }
        $a = heapify $a $n $largest
    }
    $a
}

def heapsort [arr: list<int>] -> list<int> {
    mut a = $arr
    let n = $a | length
    mut i = $n // 2 - 1
    while $i >= 0 { $a = heapify $a $n $i; $i = $i - 1 }
    $i = $n - 1
    while $i > 0 {
        let v0 = $a | get 0
        let vi = $a | get $i
        $a = $a | enumerate | each { if $in.index == 0 { $vi } else if $in.index == $i { $v0 } else { $in.item } }
        $a = heapify $a $i 0
        $i = $i - 1
    }
    $a
}

heapsort [12, 11, 13, 5, 6, 7] | print
