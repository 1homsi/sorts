---- MODULE tlaplus ----
EXTENDS Integers, Sequences, FiniteSets

RECURSIVE QuickSort(_)
QuickSort(arr) ==
    IF Len(arr) <= 1
    THEN arr
    ELSE
        LET pivot == arr[Len(arr) \div 2]
            left == SelectSeq(arr, LAMBDA x: x < pivot)
            middle == SelectSeq(arr, LAMBDA x: x = pivot)
            right == SelectSeq(arr, LAMBDA x: x > pivot)
        IN QuickSort(left) \o middle \o QuickSort(right)

THEOREM QuickSort(<<3, 6, 8, 10, 1, 2, 1>>) = <<1, 1, 2, 3, 6, 8, 10>>

====
