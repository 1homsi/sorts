def cycle-sort [arr: list<int>] -> list<int> {
    let n = ($arr | length)
    mut a = $arr
    for cycle_start in 0..($n - 2) {
        mut item = ($a | get $cycle_start)
        mut pos = $cycle_start
        for i in ($cycle_start + 1)..($n - 1) {
            if ($a | get $i) < $item {
                $pos = $pos + 1
            }
        }
        if $pos != $cycle_start {
            while ($a | get $pos) == $item {
                $pos = $pos + 1
            }
            let tmp = ($a | get $pos)
            $a = ($a | update $pos $item)
            $item = $tmp
            while $pos != $cycle_start {
                $pos = $cycle_start
                for i in ($cycle_start + 1)..($n - 1) {
                    if ($a | get $i) < $item {
                        $pos = $pos + 1
                    }
                }
                while ($a | get $pos) == $item {
                    $pos = $pos + 1
                }
                let t = ($a | get $pos)
                $a = ($a | update $pos $item)
                $item = $t
            }
        }
    }
    $a
}

cycle-sort [5, 4, 3, 2, 1]
