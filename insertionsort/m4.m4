define(`insertion_sort_step', `dnl
ifelse($1, $2, , `dnl
  define(`KEY', defn(ARR`'$1))dnl
  define(`J', eval($1 - 1))dnl
  insertion_sort_inner($1)dnl
  define(ARR`'eval(J + 1), defn(`KEY'))dnl
  insertion_sort_step(eval($1 + 1), $2)dnl
')')dnl

define(`insertion_sort', `dnl
  define(`N', $1)dnl
  insertion_sort_step(1, N)dnl
')
