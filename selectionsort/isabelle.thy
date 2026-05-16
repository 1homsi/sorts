theory SelectionSort
  imports Main
begin

fun remove_first :: "'a \<Rightarrow> 'a list \<Rightarrow> 'a list" where
  "remove_first _ [] = []" |
  "remove_first x (y # ys) = (if x = y then ys else y # remove_first x ys)"

fun selection_sort :: "'a::linorder list \<Rightarrow> 'a list" where
  "selection_sort [] = []" |
  "selection_sort xs = (let m = Min (set xs)
    in m # selection_sort (remove_first m xs))"

end
