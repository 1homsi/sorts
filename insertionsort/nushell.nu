def insertion-sort [arr: list<int>] -> list<int> {
    mut result = $arr
    let n = ($arr | length)
    for i in 1..($n - 1) {
        let key = $result | get $i
        mut j = $i - 1
        while $j >= 0 and ($result | get $j) > $key {
            let v = $result | get $j
            $result = ($result | update ($j + 1) $v)
            $j = $j - 1
        }
        $result = ($result | update ($j + 1) $key)
    }
    $result
}
