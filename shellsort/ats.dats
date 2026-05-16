#include "share/atspre_staload.hats"

fun shell_sort {n:int} (arr: &(@[int][n]), n: int n): void =
  let
    var gap: int = n / 2
  in
    while (gap > 0)
      (let
        var i: int = gap
      in
        while (i < n)
          (let
            val temp = arr.[i]
            var j: int = i
          in
            while (j >= gap && arr.[j-gap] > temp)
              (arr.[j] := arr.[j-gap]; j := j - gap);
            arr.[j] := temp;
            i := i + 1
          end);
        gap := gap / 2
      end)
  end

implement main0 () =
  let
    var arr = @[int](64, 34, 25, 12, 22, 11, 90)
    val () = shell_sort (arr, 7)
    val () = array_foreach<int> (arr, 7, lam (x) => (print x; print " "))
    val () = print_newline ()
  in end
