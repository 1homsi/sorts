def cocktail-sort [arr: list<int>] -> list<int> {
    mut a = $arr
    mut swapped = true
    mut start = 0
    mut end = ($arr | length) - 1
    while $swapped {
        $swapped = false
        for i in ($start..<$end) {
            if ($a | get $i) > ($a | get ($i + 1)) {
                let tmp = $a | get $i
                $a = ($a | update $i ($a | get ($i + 1)) | update ($i + 1) $tmp)
                $swapped = true
            }
        }
        if not $swapped { break }
        $swapped = false
        $end = $end - 1
        mut i = $end - 1
        while $i >= $start {
            if ($a | get $i) > ($a | get ($i + 1)) {
                let tmp = $a | get $i
                $a = ($a | update $i ($a | get ($i + 1)) | update ($i + 1) $tmp)
                $swapped = true
            }
            $i = $i - 1
        }
        $start = $start + 1
    }
    $a
}
