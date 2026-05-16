module: cocktail-sort

define function cocktail-sort(arr :: <vector>) => (arr :: <vector>)
  let swapped = #t;
  let start = 0;
  let ending = size(arr) - 1;
  block (done)
    while (swapped)
      swapped := #f;
      for (i from start below ending)
        when (arr[i] > arr[i + 1])
          let tmp = arr[i];
          arr[i] := arr[i + 1];
          arr[i + 1] := tmp;
          swapped := #t;
        end when;
      end for;
      unless (swapped) done() end;
      swapped := #f;
      ending := ending - 1;
      for (i from ending - 1 to start by -1)
        when (arr[i] > arr[i + 1])
          let tmp = arr[i];
          arr[i] := arr[i + 1];
          arr[i + 1] := tmp;
          swapped := #t;
        end when;
      end for;
      start := start + 1;
    end while;
  end block;
  arr
end function;
