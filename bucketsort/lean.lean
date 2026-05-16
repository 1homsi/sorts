def insertSorted (x : Float) : List Float → List Float
  | [] => [x]
  | h :: t => if x <= h then x :: h :: t else h :: insertSorted x t

def insertionSort : List Float → List Float
  | [] => []
  | h :: t => insertSorted h (insertionSort t)

def getIdx (num mn mx : Float) (n : Nat) : Nat :=
  let range := mx - mn + 1
  let raw := (((num - mn) / range) * n.toFloat).toUInt64.toNat
  min (n - 1) raw

def fillBuckets (arr : List Float) (mn mx : Float) (n : Nat)
    (buckets : Array (List Float)) : Array (List Float) :=
  arr.foldl (fun bs x =>
    let idx := getIdx x mn mx n
    bs.modify idx (fun b => b ++ [x])) buckets

def bucketSort (arr : List Float) : List Float :=
  if arr.isEmpty then arr
  else
    let n := arr.length
    let mn := arr.foldl Float.min arr.head!
    let mx := arr.foldl Float.max arr.head!
    let buckets := Array.mkArray n []
    let filled := fillBuckets arr mn mx n buckets
    filled.toList.bind insertionSort

#eval bucketSort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
