begin
  integer array arr[1:6];
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;
  
  procedure merge(left, mid, right);
  integer left, mid, right;
  begin
    integer array result[1:right-left+1];
    integer i, j, k;
    i := left; j := mid + 1; k := 1;
    
    while i <= mid && j <= right do
    begin
      if arr[i] <= arr[j] then
      begin
        result[k] := arr[i]; i := i + 1;
      end else
      begin
        result[k] := arr[j]; j := j + 1;
      end;
      k := k + 1;
    end;
    
    while i <= mid do
    begin
      result[k] := arr[i]; i := i + 1; k := k + 1;
    end;
    
    while j <= right do
    begin
      result[k] := arr[j]; j := j + 1; k := k + 1;
    end;
    
    for k := 1 step 1 until right - left + 1 do
      arr[left + k - 1] := result[k];
  end;
  
  procedure mergesort(left, right);
  integer left, right;
  begin
    integer mid;
    if left < right then
    begin
      mid := (left + right) div 2;
      mergesort(left, mid);
      mergesort(mid + 1, right);
      merge(left, mid, right);
    end;
  end;
  
  mergesort(1, 6);
  outinteger(arr[1]); outinteger(arr[2]); outinteger(arr[3]);
  outinteger(arr[4]); outinteger(arr[5]); outinteger(arr[6]);
end
