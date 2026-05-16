def gnome-sort [arr: list<int>] -> list<int> {
    mut a = $arr
    mut i = 0
    let n = ($arr | length)
    while $i < $n {
        if $i == 0 or ($a | get $i) >= ($a | get ($i - 1)) {
            $i = $i + 1
        } else {
            let tmp = ($a | get $i)
            $a = ($a | upsert $i ($a | get ($i - 1)))
            $a = ($a | upsert ($i - 1) $tmp)
            $i = $i - 1
        }
    }
    $a
}
