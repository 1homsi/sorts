module: comb-sort

define function comb-sort(arr :: <vector>) => (result :: <vector>)
  let n = size(arr);
  let gap = n;
  let sorted = #f;
  while (~sorted)
    gap := truncate/(gap, 1.3);
    if (gap <= 1)
      gap := 1;
      sorted := #t;
    end if;
    for (i from 0 below n - gap)
      if (arr[i] > arr[i + gap])
        let tmp = arr[i];
        arr[i] := arr[i + gap];
        arr[i + gap] := tmp;
        sorted := #f;
      end if;
    end for;
  end while;
  arr
end function;
