def compare-and-swap [arr: list<int>, i: int, j: int, dir: bool] -> list<int> {
    let ai = $arr | get $i
    let aj = $arr | get $j
    if $dir == ($ai > $aj) {
        $arr | update $i $aj | update $j $ai
    } else {
        $arr
    }
}

def bitonic-merge [arr: list<int>, lo: int, cnt: int, dir: bool] -> list<int> {
    if $cnt <= 1 {
        return $arr
    }
    let k = $cnt / 2
    let arr1 = (seq $lo ($lo + $k - 1))
        | reduce -f $arr {|i, a| compare-and-swap $a $i ($i + $k) $dir}
    let arr2 = bitonic-merge $arr1 $lo $k $dir
    bitonic-merge $arr2 ($lo + $k) $k $dir
}

def bitonic-sort [arr: list<int>, lo: int, cnt: int, dir: bool] -> list<int> {
    if $cnt <= 1 {
        return $arr
    }
    let k = $cnt / 2
    let arr1 = bitonic-sort $arr $lo $k true
    let arr2 = bitonic-sort $arr1 ($lo + $k) $k false
    bitonic-merge $arr2 $lo $cnt $dir
}

let data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonic-sort $data 0 ($data | length) true
