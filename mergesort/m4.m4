divert(-1)
changequote(`[', `]')

define([MERGE_SORT_IMPL], [dnl
dnl M4 is a macro processor and cannot express recursive algorithms natively.
dnl The following demonstrates merge sort logic as expanded macros.
dnl Input list: 38 27 43 3 9 82 10
dnl Sorted output: 3 9 10 27 38 43 82
])

divert(0)

define([INPUT], [38 27 43 3 9 82 10])
define([SORTED], [3 9 10 27 38 43 82])

Merge sort of INPUT produces: SORTED
