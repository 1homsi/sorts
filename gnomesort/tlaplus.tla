---- MODULE GnomeSort ----
EXTENDS Sequences, Naturals, FiniteSets

VARIABLES arr, i, n

Init ==
    /\ arr = <<5, 3, 8, 1, 9, 2, 7, 4, 6, 0>>
    /\ n = 10
    /\ i = 1

Advance ==
    /\ \/ i = 1
       \/ arr[i] >= arr[i-1]
    /\ i' = i + 1
    /\ UNCHANGED <<arr, n>>

Swap ==
    /\ i > 1
    /\ arr[i] < arr[i-1]
    /\ arr' = [arr EXCEPT ![i] = arr[i-1], ![i-1] = arr[i]]
    /\ i' = i - 1
    /\ UNCHANGED n

Done == i > n /\ UNCHANGED <<arr, i, n>>

Next == \/ Advance
        \/ Swap
        \/ Done

Spec == Init /\ [][Next]_<<arr, i, n>>

IsSorted == \A k \in 1..n-1 : arr[k] <= arr[k+1]

====
