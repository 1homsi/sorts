List quicksort := method(
    if(size <= 1, return self)
    pivot := at(size / 2 floor)
    left := select(x, x < pivot)
    middle := select(x, x == pivot)
    right := select(x, x > pivot)
    left quicksort appendSeq(middle) appendSeq(right quicksort)
)

writeln(list(3, 6, 8, 10, 1, 2, 1) quicksort)
