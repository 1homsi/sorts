using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

shell_sort<public>() : void =
    Arr : []int = array{64, 34, 25, 12, 22, 11, 90}
    N : int = Arr.Length
    var Gap : int = N / 2
    loop:
        if Gap > 0 then
            for I := Gap..N-1:
                Temp := Arr[I]
                var J : int = I
                loop:
                    if J >= Gap and Arr[J - Gap] > Temp then
                        set Arr[J] = Arr[J - Gap]
                        set J = J - Gap
                    else:
                        break
                set Arr[J] = Temp
            set Gap = Gap / 2
        else:
            break
