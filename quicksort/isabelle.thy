theory Quicksort
  imports Main
begin

fun quicksort :: "int list \<Rightarrow> int list" where
  "quicksort [] = []"
| "quicksort (pivot # rest) =
    quicksort [x \<leftarrow> rest. x \<le> pivot] @
    [pivot] @
    quicksort [x \<leftarrow> rest. x > pivot]"

lemma "quicksort [3, 6, 8, 10, 1, 2, 1] = [1, 1, 2, 3, 6, 8, 10]"
  by eval

theorem quicksort_sorts: "sorted (quicksort xs)"
  by (induct xs rule: quicksort.induct) (auto simp: sorted_append)

end
