using { /Verse.org/Simulation/V2 }

IsSorted(Arr: []int): logic =
    var I: int = 0
    loop:
        if (I >= Arr.Length - 1) then break
        if (Arr[I] > Arr[I + 1]) then return false
        set I = I + 1
    return true

Shuffle(Arr: []int): []int =
    var A: []int = Arr
    var N: int = A.Length
    var I: int = N - 1
    loop:
        if (I <= 0) then break
        J := Rand_Int(0, I)
        Tmp := A[I]
        set A[I] = A[J]
        set A[J] = Tmp
        set I = I - 1
    A

Bogosort(Arr: []int): []int =
    var A: []int = Arr
    loop:
        if (IsSorted(A)) then break
        set A = Shuffle(A)
    A

BogosortExample := Bogosort(array{3, 1, 4, 1, 5, 9, 2, 6})
