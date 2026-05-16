begin
  integer array arr[1:6];
  integer i, n;
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;
  n := 6;
  for i := n div 2 downto 1 do
    siftdown(arr, i, n);
  for i := n downto 2 do
    begin
      integer temp;
      temp := arr[1];
      arr[1] := arr[i];
      arr[i] := temp;
      siftdown(arr, 1, i - 1);
    end;
  for i := 1 step 1 until n do
    print(arr[i]);
end

procedure siftdown(arr, idx, n);
  integer array arr;
  integer idx, n, largest, left, right;
  begin
    largest := idx;
    left := 2 * idx;
    right := 2 * idx + 1;
    if left ≤ n ∧ arr[left] > arr[largest] then
      largest := left;
    if right ≤ n ∧ arr[right] > arr[largest] then
      largest := right;
    if largest ≠ idx then
      begin
        integer temp;
        temp := arr[idx];
        arr[idx] := arr[largest];
        arr[largest] := temp;
        siftdown(arr, largest, n);
      end
  end;
