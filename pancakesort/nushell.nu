def flip [arr: list<int>, k: int] -> list<int> {
    let front = ($arr | first ($k + 1) | reverse)
    let back = ($arr | skip ($k + 1))
    $front | append $back
}

def find-max-idx [arr: list<int>, size: int] -> int {
    let sub = ($arr | first $size)
    let max_val = ($sub | math max)
    $sub | enumerate | where { |x| $x.item == $max_val } | first | get index
}

def pancake-sort [arr: list<int>] -> list<int> {
    mut a = $arr
    mut size = ($arr | length)
    while $size > 1 {
        let mi = (find-max-idx $a $size)
        if $mi != ($size - 1) {
            if $mi != 0 {
                $a = (flip $a $mi)
            }
            $a = (flip $a ($size - 1))
        }
        $size = $size - 1
    }
    $a
}

pancake-sort [3, 6, 2, 7, 4, 1, 5]
