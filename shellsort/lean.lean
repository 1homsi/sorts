def shellSort (arr : Array Int) : Array Int := Id.run do
  let n := arr.size
  let mut a := arr
  let mut gap := n / 2
  while gap > 0 do
    let mut i := gap
    while i < n do
      let temp := a[i]!
      let mut j := i
      while j >= gap && a[j - gap]! > temp do
        a := a.set! j a[j - gap]!
        j := j - gap
      a := a.set! j temp
      i := i + 1
    gap := gap / 2
  return a

def main : IO Unit := do
  let arr : Array Int := #[64, 34, 25, 12, 22, 11, 90]
  let sorted := shellSort arr
  IO.println (toString sorted.toList)
