def quicksort(lst) {
    if (lst.size() <= 1) { return lst }
    def pivot := lst[lst.size() // 2]
    def left := lst.select(fn x { x < pivot })
    def middle := lst.select(fn x { x == pivot })
    def right := lst.select(fn x { x > pivot })
    return quicksort(left) + middle + quicksort(right)
}

println(quicksort([3, 6, 8, 10, 1, 2, 1]))
