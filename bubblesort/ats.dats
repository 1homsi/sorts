#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

implement main0() = {
  val arr = arrayptr_make_elt<int>(7, 0)
  val () = arr[0] := 64; val () = arr[1] := 34; val () = arr[2] := 25
  val () = arr[3] := 12; val () = arr[4] := 22; val () = arr[5] := 11
  val () = arr[6] := 90

  var n: int = 7
  var swapped: bool = true
  val () = while (swapped) {
    val () = swapped := false
    var i: int = 0
    val () = while (i < n - 1) {
      if arr[i] > arr[i+1] then {
        val tmp = arr[i]
        val () = arr[i] := arr[i+1]
        val () = arr[i+1] := tmp
        val () = swapped := true
      }
      val () = i := i + 1
    }
    val () = n := n - 1
  }
  var i: int = 0
  val () = while (i < 7) {
    val () = print(arr[i]); val () = print(' ')
    val () = i := i + 1
  }
  val () = print_newline()
  val () = arrayptr_free(arr)
}
