def merge [left: list<int>, right: list<int>] -> list<int> {
    mut result = []
    mut i = 0
    mut j = 0
    while $i < ($left | length) and $j < ($right | length) {
        if ($left | get $i) <= ($right | get $j) {
            $result = ($result | append ($left | get $i))
            $i = $i + 1
        } else {
            $result = ($result | append ($right | get $j))
            $j = $j + 1
        }
    }
    while $i < ($left | length) {
        $result = ($result | append ($left | get $i))
        $i = $i + 1
    }
    while $j < ($right | length) {
        $result = ($result | append ($right | get $j))
        $j = $j + 1
    }
    $result
}

def merge_sort [arr: list<int>] -> list<int> {
    let n = $arr | length
    if $n <= 1 { return $arr }
    let mid = $n / 2
    let left = merge_sort ($arr | first $mid)
    let right = merge_sort ($arr | skip $mid)
    merge $left $right
}

let arr = [38, 27, 43, 3, 9, 82, 10]
print (merge_sort $arr)
