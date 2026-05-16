define function insertion-sort (arr :: <vector>) => (sorted :: <vector>)
  let n = arr.size;
  for (i from 1 below n)
    let key = arr[i];
    let j = i - 1;
    while (j >= 0 & arr[j] > key)
      arr[j + 1] := arr[j];
      j := j - 1;
    end while;
    arr[j + 1] := key;
  end for;
  arr
end function;
