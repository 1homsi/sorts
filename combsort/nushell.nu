def comb-sort [arr: list<int>] {
    mut a = $arr
    let n = ($a | length)
    mut gap = $n
    mut sorted = false

    while not $sorted {
        $gap = ($gap * 10 // 13)
        if $gap <= 1 {
            $gap = 1
            $sorted = true
        }
        mut i = 0
        while $i + $gap < $n {
            if ($a | get $i) > ($a | get ($i + $gap)) {
                let tmp = ($a | get $i)
                $a = ($a | update $i ($a | get ($i + $gap)) | update ($i + $gap) $tmp)
                $sorted = false
            }
            $i = $i + 1
        }
    }
    $a
}
