def bubble-sort [arr: list<int>] {
    mut a = $arr
    mut n = ($a | length)
    mut swapped = true
    while $swapped {
        $swapped = false
        for i in 0..($n - 2) {
            if ($a | get $i) > ($a | get ($i + 1)) {
                let tmp = ($a | get $i)
                $a = ($a | update $i ($a | get ($i + 1)) | update ($i + 1) $tmp)
                $swapped = true
            }
        }
        $n = $n - 1
    }
    $a
}

[64, 34, 25, 12, 22, 11, 90] | bubble-sort
