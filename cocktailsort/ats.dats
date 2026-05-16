#include "share/atspre_staload.hats"

fun cocktailSort {n:nat} (arr: array(int, n), n: int n): void =
  let
    var swapped: bool = true
    var start: int = 0
    var end: int = n - 1
  in
    while (swapped) begin
      swapped := false;
      var i: int = start;
      while (i < end) begin
        if arr[i] > arr[i+1] then begin
          val tmp = arr[i];
          arr[i] := arr[i+1];
          arr[i+1] := tmp;
          swapped := true
        end;
        i := i + 1
      end;
      if ~swapped then break;
      swapped := false;
      end := end - 1;
      i := end - 1;
      while (i >= start) begin
        if arr[i] > arr[i+1] then begin
          val tmp = arr[i];
          arr[i] := arr[i+1];
          arr[i+1] := tmp;
          swapped := true
        end;
        i := i - 1
      end;
      start := start + 1
    end
  end
