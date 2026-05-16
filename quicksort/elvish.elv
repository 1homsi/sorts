fn quicksort {|@arr|
    if (<= (count $arr) 1) {
        put $@arr
        return
    }
    var n = (count $arr)
    var pivot_idx = (/ $n 2)
    var pivot = $arr[$pivot_idx]
    var left = []
    var middle = []
    var right = []
    for x $arr {
        if (< $x $pivot) {
            set left = [$@left $x]
        } elif (== $x $pivot) {
            set middle = [$@middle $x]
        } else {
            set right = [$@right $x]
        }
    }
    var sl = [(quicksort $@left)]
    var sr = [(quicksort $@right)]
    put $@sl $@middle $@sr
}

quicksort 3 6 8 10 1 2 1
