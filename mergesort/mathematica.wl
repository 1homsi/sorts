mergeLists[{}, right_] := right
mergeLists[left_, {}] := left
mergeLists[left_List, right_List] :=
  If[First[left] <= First[right],
    Prepend[mergeLists[Rest[left], right], First[left]],
    Prepend[mergeLists[left, Rest[right]], First[right]]]

mergeSort[{}] := {}
mergeSort[{x_}] := {x}
mergeSort[lst_List] :=
  Module[{mid = Floor[Length[lst]/2]},
    mergeLists[
      mergeSort[lst[[1;;mid]]],
      mergeSort[lst[[mid+1;;-1]]]]]

Print[mergeSort[{38, 27, 43, 3, 9, 82, 10}]]
