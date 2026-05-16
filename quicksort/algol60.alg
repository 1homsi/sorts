begin
  array arr[1:6];
  integer i;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  procedure quicksort(a, n);
    array a; integer n;
  begin
    integer i, j, pivot, temp;
    if n <= 1 then go to done;
    pivot := a[1];
    i := 1; j := n;
    loop: begin
      while a[i] < pivot do i := i + 1;
      while a[j] > pivot do j := j - 1;
      if i < j then begin
        temp := a[i]; a[i] := a[j]; a[j] := temp;
        i := i + 1; j := j - 1;
        go to loop;
      end;
    end;
    done:
  end;

  quicksort(arr, 6);
  for i := 1 step 1 until 6 do print(arr[i]);
end