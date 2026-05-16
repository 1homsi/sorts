function insertionSort
  input Integer arr[:];
  output Integer sorted[size(arr, 1)];
protected
  Integer n = size(arr, 1);
  Integer key;
  Integer j;
algorithm
  sorted := arr;
  for i in 2:n loop
    key := sorted[i];
    j := i - 1;
    while j >= 1 and sorted[j] > key loop
      sorted[j + 1] := sorted[j];
      j := j - 1;
    end while;
    sorted[j + 1] := key;
  end for;
end insertionSort;
