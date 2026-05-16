def quicksort [arr: list<int>] -> list<int> {
    if ($arr | length) <= 1 {
        return $arr
    }
    let pivot = ($arr | get (($arr | length) // 2))
    let left = ($arr | where $it < $pivot)
    let middle = ($arr | where $it == $pivot)
    let right = ($arr | where $it > $pivot)
    [(quicksort $left), $middle, (quicksort $right)] | flatten
}

quicksort [3, 6, 8, 10, 1, 2, 1] | print
