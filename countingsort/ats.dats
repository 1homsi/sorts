#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"

implement main0 () = {
  val arr = $list{int}(4, 2, 2, 8, 3, 3, 1)
  val sorted = list_sort<int>(arr, lam(x, y) => compare(x, y))
  val () = list_app<int>(sorted, lam(v) => (print(v); print(" ")))
  val () = print_newline()
}
