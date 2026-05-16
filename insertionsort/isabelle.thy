theory InsertionSort
  imports Main
begin

fun insert :: "int \<Rightarrow> int list \<Rightarrow> int list" where
  "insert x [] = [x]" |
  "insert x (y # ys) = (if x \<le> y then x # y # ys else y # insert x ys)"

fun insertion_sort :: "int list \<Rightarrow> int list" where
  "insertion_sort [] = []" |
  "insertion_sort (x # xs) = insert x (insertion_sort xs)"

end
