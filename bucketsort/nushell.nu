def insertion-sort [bucket: list<float>] -> list<float> {
    mut arr = $bucket
    let n = ($arr | length)
    mut i = 1
    while $i < $n {
        let key = $arr | get $i
        mut j = $i - 1
        while $j >= 0 and ($arr | get $j) > $key {
            let val = $arr | get $j
            $arr = ($arr | upsert ($j + 1) $val)
            $j = $j - 1
        }
        $arr = ($arr | upsert ($j + 1) $key)
        $i = $i + 1
    }
    $arr
}

def bucket-sort [arr: list<float>] -> list<float> {
    let n = ($arr | length)
    if $n == 0 { return $arr }
    let min_v = ($arr | math min)
    let max_v = ($arr | math max)
    mut buckets = (0..<$n | each { [] })
    for num in $arr {
        mut idx = (($num - $min_v) / ($max_v - $min_v + 1) * $n | math floor | into int)
        if $idx >= $n { $idx = $n - 1 }
        $buckets = ($buckets | upsert $idx ($buckets | get $idx | append $num))
    }
    $buckets | each { |b| insertion-sort $b } | flatten
}

let data = [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]
print (bucket-sort $data)
