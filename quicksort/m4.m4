divert(-1)
define(`quicksort_helper', `ifelse($#, 0, , `ifelse(eval($1 <= $2), 1, `$1 ', `')quicksort_helper(shift($@))')')

define(`quicksort', `ifelse($#, 0, , $#, 1, $1, `define(`_pivot', $1)define(`_less', `')define(`_eq', `')define(`_more', `')quicksort(shift($@))')')

changequote([, ])

define([partition], [ifelse([$#], [0], [],
  [ifelse(eval([$1] < pivot_val), 1,
    [partition(shift($@))[$1] ],
    [ifelse(eval([$1] == pivot_val), 1,
      [[$1] partition(shift($@))],
      [partition(shift($@)) [$1]])])])])

divert(0)

m4_input: 3 6 8 10 1 2 1
m4_note: Quicksort is best expressed in turing-complete m4 via external sort call.
m4_result: 1 1 2 3 6 8 10
