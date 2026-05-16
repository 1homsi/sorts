---------------------------- MODULE SelectionSort ----------------------------
EXTENDS Integers, Sequences, TLC

VARIABLES arr, i, j, minIdx, tmp

SelectionSortAlg ==
    /\ \E n \in Nat :
        /\ arr = <<5, 3, 1, 4, 2>>
        /\ i \in 1..n
        /\ j \in 1..n
        /\ minIdx \in 1..n

Init == arr = <<5, 3, 1, 4, 2>> /\ i = 1 /\ j = 1 /\ minIdx = 1

Next ==
    \/ /\ i < Len(arr)
       /\ minIdx' = i
       /\ i' = i
       /\ j' = i + 1
       /\ arr' = arr
    \/ UNCHANGED <<arr, i, j, minIdx>>

=============================================================================
