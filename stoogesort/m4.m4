define(`stooge_sort_impl', `dnl
ifelse(eval($1 > $2), 1, `swap($1, $2)')dnl
ifelse(eval($2 - $1 + 1 > 2), 1, `dnl
define(`T', eval(($2 - $1 + 1) * 2 / 3))dnl
stooge_sort_impl($1, eval($1 + T - 1))dnl
stooge_sort_impl(eval($2 - T + 1), $2)dnl
stooge_sort_impl($1, eval($1 + T - 1))dnl
')dnl
')

m4_array([3, 1, 4, 1, 5, 9, 2, 6])
stooge_sort_impl(0, 7)
