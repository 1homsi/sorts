divert(-1)

define(`is_sorted', `dnl
ifelse(`$#', `0', `1', `$#', `1', `1', dnl
ifelse(eval(`$1 <= $2'), `1', `is_sorted(shift($@))', `0'))')

define(`SWAP', `define(`$1_$2', defn(`$1_$3'))define(`$1_$3', `$4')')

define(`bogosort_impl', `dnl
ifelse(is_sorted($@), `1', `$@', dnl
`bogosort_impl(shuffle($@))')')

define(`arr', `3 1 4 1 5 9 2 6')

divert(0)dnl
arr
