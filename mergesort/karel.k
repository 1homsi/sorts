task main
  integers: array[1..6] of integer
  
  array[1] := 5
  array[2] := 2
  array[3] := 8
  array[4] := 1
  array[5] := 9
  array[6] := 3
  
  mergesort(array, 1, 6)
  output array
end

routine mergesort(arr: array[1..n] of integer; left, right: integer)
begin
  integer: mid
  
  if left < right then begin
    mid := (left + right) div 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  end
end

routine merge(arr: array[1..n] of integer; left, mid, right: integer)
begin
  integer: i, j, k
  array: result[1..(right - left + 1)] of integer
  
  i := left
  j := mid + 1
  k := 1
  
  loop while (i <= mid) and (j <= right) do begin
    if arr[i] <= arr[j] then begin
      result[k] := arr[i]
      i := i + 1
    end else begin
      result[k] := arr[j]
      j := j + 1
    end
    k := k + 1
  end
end
