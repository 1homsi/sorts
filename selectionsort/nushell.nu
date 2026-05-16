def selection-sort [arr: list<int>] {
    let n = ($arr | length)
    mut result = $arr
    for i in 0..($n - 1) {
        mut min_idx = $i
        for j in ($i + 1)..($n - 1) {
            if $result.$j < $result.$min_idx {
                $min_idx = $j
            }
        }
        let tmp = $result.$i
        $result = ($result | update $i $result.$min_idx | update $min_idx $tmp)
    }
    $result
}
