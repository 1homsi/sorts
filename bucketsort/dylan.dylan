module: bucket-sort

define function insertion-sort (bucket :: <vector>) => (result :: <vector>)
  let n = size(bucket);
  for (i from 1 below n)
    let key = bucket[i];
    let j = i - 1;
    while (j >= 0 & bucket[j] > key)
      bucket[j + 1] := bucket[j];
      j := j - 1;
    end while;
    bucket[j + 1] := key;
  end for;
  bucket
end function;

define function bucket-sort (arr :: <vector>) => (result :: <vector>)
  let n = size(arr);
  if (n = 0) then return(arr) end;
  let min-v = reduce(min, arr[0], arr);
  let max-v = reduce(max, arr[0], arr);
  let buckets = make(<vector>, size: n, fill: #());
  for (num in arr)
    let idx = floor((num - min-v) / (max-v - min-v + 1) * n);
    let safe-idx = min(n - 1, idx);
    buckets[safe-idx] := add!(buckets[safe-idx], num);
  end for;
  let result = make(<stretchy-vector>);
  for (bucket in buckets)
    let sorted = insertion-sort(as(<vector>, bucket));
    for (v in sorted) add!(result, v) end;
  end for;
  as(<vector>, result)
end function;

let data = vector(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68);
format-out("%=\n", bucket-sort(data));
