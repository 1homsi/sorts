define method bubble-sort (arr :: <array>) => (result :: <array>)
  let n = arr.size;
  let swapped = #t;
  while (swapped)
    swapped := #f;
    for (i from 0 below n - 1)
      when (arr[i] > arr[i + 1])
        let tmp = arr[i];
        arr[i] := arr[i + 1];
        arr[i + 1] := tmp;
        swapped := #t;
      end when;
    end for;
    n := n - 1;
  end while;
  arr
end method;

let arr = vector(64, 34, 25, 12, 22, 11, 90);
format-out("%=\n", bubble-sort(arr));
