def mergeList : List Int → List Int → List Int
  | [], right => right
  | left, [] => left
  | lh :: lt, rh :: rt =>
    if lh ≤ rh then lh :: mergeList lt (rh :: rt)
    else rh :: mergeList (lh :: lt) rt

def mergeSort : List Int → List Int
  | [] => []
  | [x] => [x]
  | lst =>
    let mid := lst.length / 2
    let left := lst.take mid
    let right := lst.drop mid
    mergeList (mergeSort left) (mergeSort right)
termination_by lst => lst.length

#eval mergeSort [38, 27, 43, 3, 9, 82, 10]
