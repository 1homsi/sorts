def is-sorted [arr: list<int>] -> bool {
    let n = ($arr | length)
    let pairs = (0..($n - 2) | each { |i| [$arr, ($i)] })
    $pairs | all { |pair|
        let i = ($pair | last)
        ($arr | get $i) <= ($arr | get ($i + 1))
    }
}

def bogosort [arr: list<int>] -> list<int> {
    mut a = $arr
    while not (is-sorted $a) {
        $a = ($a | shuffle)
    }
    $a
}

let arr = [3 1 4 1 5 9 2 6]
bogosort $arr
