InsertionSort<public>():void=
    Arr:[]int = array{5, 3, 1, 4, 2}
    N:int = Arr.Length
    var I:int = 1
    loop:
        if(I >= N): break
        Key:int = Arr[I]
        var J:int = I - 1
        loop:
            if(J < 0 or Arr[J] <= Key): break
            set Arr[J+1] = Arr[J]
            set J = J - 1
        set Arr[J+1] = Key
        set I = I + 1
