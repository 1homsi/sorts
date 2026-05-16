def stooge-sort [arr: list<int>, first: int, last: int] -> list<int> {
    let a = ($arr | get $first)
    let b = ($arr | get $last)
    let arr1 = if $a > $b {
        $arr | enumerate | each { |it|
            if $it.index == $first { $b }
            else if $it.index == $last { $a }
            else { $it.item }
        }
    } else { $arr }
    let n = $last - $first + 1
    if $n > 2 {
        let t = ($n * 2 // 3)
        let arr2 = (stooge-sort $arr1 $first ($first + $t - 1))
        let arr3 = (stooge-sort $arr2 ($last - $t + 1) $last)
        stooge-sort $arr3 $first ($first + $t - 1)
    } else { $arr1 }
}

let arr = [3, 1, 4, 1, 5, 9, 2, 6]
stooge-sort $arr 0 (($arr | length) - 1) | print
