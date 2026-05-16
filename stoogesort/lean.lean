import Std.Data.Array

def stoogeSort (arr : Array Int) (first last : Nat) : Array Int :=
    if h : first < arr.size ∧ last < arr.size then
        let a := arr[first]'h.1
        let b := arr[last]'h.2
        let arr := if a > b then arr.set ⟨first, h.1⟩ b |>.set ⟨last, h.2⟩ a else arr
        if last - first + 1 > 2 then
            let t := (last - first + 1) * 2 / 3
            let arr := stoogeSort arr first (first + t - 1)
            let arr := stoogeSort arr (last - t + 1) last
            stoogeSort arr first (first + t - 1)
        else arr
    else arr

def main : IO Unit := do
    let arr : Array Int := #[3, 1, 4, 1, 5, 9, 2, 6]
    let sorted := stoogeSort arr 0 (arr.size - 1)
    IO.println s!"{sorted}"
