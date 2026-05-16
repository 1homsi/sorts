#include "share/atspre_staload.hats"

staload "libc/SATS/stdlib.sats"
staload "libc/SATS/stdio.sats"

implement main0 () = {
  val arr = @[int][8](3, 1, 4, 1, 5, 9, 2, 6)
  val n = 8
  var sorted: bool = false

  fun is_sorted {n:nat} (a: &(@[int][n]), n: int n): bool =
    let
      fun loop (i: int): bool =
        if i >= n - 1 then true
        else if a.[i2s i] > a.[i2s (i+1)] then false
        else loop (i+1)
    in loop 0 end

  fun do_shuffle {n:nat} (a: &(@[int][n]), n: int n): void =
    let
      fun loop (i: int): void =
        if i <= 0 then ()
        else let
          val j = rand() mod (i + 1)
          val tmp = a.[i2s i]
          val () = a.[i2s i] := a.[i2s j]
          val () = a.[i2s j] := tmp
        in loop (i - 1) end
    in loop (n - 1) end

  val () = while (~(is_sorted (arr, n))) (do_shuffle (arr, n))
  val () = for* {i:nat | i <= 8} .<8 - i>. (i: int i) =>
    if i < 8 then (printf ("%d ", @(arr.[i2s i])); $continue (i + 1))
  val () = print_newline ()
}
