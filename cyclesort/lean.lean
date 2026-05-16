def countSmaller (arr : Array Int) (item : Int) (start : Nat) : Nat :=
  let rec go (i : Nat) (acc : Nat) : Nat :=
    if i >= arr.size then acc
    else if arr[i]! < item then go (i + 1) (acc + 1)
    else go (i + 1) acc
  go start 0

def cycleSort (arr : Array Int) : Array Int := Id.run do
  let mut a := arr
  let n := a.size
  for cycleStart in List.range (n - 1) do
    let mut item := a[cycleStart]!
    let mut pos := cycleStart
    for i in List.range (n - cycleStart - 1) do
      let i := i + cycleStart + 1
      if a[i]! < item then pos := pos + 1
    if pos != cycleStart then
      while item == a[pos]! do
        pos := pos + 1
      let tmp := a[pos]!
      a := a.set! pos item
      item := tmp
      while pos != cycleStart do
        pos := cycleStart
        for i in List.range (n - cycleStart - 1) do
          let i := i + cycleStart + 1
          if a[i]! < item then pos := pos + 1
        while item == a[pos]! do
          pos := pos + 1
        let t := a[pos]!
        a := a.set! pos item
        item := t
  return a

#eval cycleSort #[5, 4, 3, 2, 1]
