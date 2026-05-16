divert(-1)
changequote(`[', `]')

define([COCKTAIL_SORT_DONE], [0])

define([SWAP], [dnl
define([$1_$2], defn([$1_$3]))dnl
define([$1_$3], defn([$1_$2_old]))dnl
])

define([COCKTAIL_SORT], [dnl
  pushdef([_arr], [$1])dnl
  pushdef([_n], [$2])dnl
  $1 is being cocktail sorted with $2 elements
  popdef([_n])dnl
  popdef([_arr])dnl
])

divert(0)dnl
COCKTAIL_SORT([myarray], [10])
