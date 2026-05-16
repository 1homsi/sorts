C COUNTINGSORT PROGRAM
T "Counting Sort Example"

U MAX
U COUNT
U OUTPUT
U I
U J
U ARR1, ARR2, ARR3, ARR4, ARR5, ARR6

M1  T "Enter sorting array or use default"
    A ARR1, ARR2, ARR3, ARR4, ARR5, ARR6
    J M2
    ARR1 := 5
    ARR2 := 2
    ARR3 := 8
    ARR4 := 1
    ARR5 := 9
    ARR6 := 3

M2  MAX := 0
    I := 1
L1  C I > 6, J M3
    A ARR[I]
    C ARR[I] > MAX
    MAX := ARR[I]
    I := I + 1
    J L1

M3  I := 0
L2  C I > MAX, J M4
    COUNT[I] := 0
    I := I + 1
    J L2

M4  T "Sorted Array:"
    J END

END
