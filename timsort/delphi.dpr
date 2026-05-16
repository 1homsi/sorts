program TimSortDelphi;

{$APPTYPE CONSOLE}

uses SysUtils;

const
  MIN_RUN = 32;

type
  TIntArray = array of Integer;

procedure InsertionSort(var arr: TIntArray; left, right: Integer);
var
  i, j, key: Integer;
begin
  for i := left + 1 to right do begin
    key := arr[i];
    j := i - 1;
    while (j >= left) and (arr[j] > key) do begin
      arr[j + 1] := arr[j];
      Dec(j);
    end;
    arr[j + 1] := key;
  end;
end;

procedure Merge(var arr: TIntArray; left, mid, right: Integer);
var
  lp, rp: TIntArray;
  i, j, k, ln, rn: Integer;
begin
  ln := mid - left + 1;
  rn := right - mid;
  SetLength(lp, ln);
  SetLength(rp, rn);
  for i := 0 to ln - 1 do lp[i] := arr[left + i];
  for i := 0 to rn - 1 do rp[i] := arr[mid + 1 + i];
  i := 0; j := 0; k := left;
  while (i < ln) and (j < rn) do begin
    if lp[i] <= rp[j] then begin arr[k] := lp[i]; Inc(i); end
    else begin arr[k] := rp[j]; Inc(j); end;
    Inc(k);
  end;
  while i < ln do begin arr[k] := lp[i]; Inc(i); Inc(k); end;
  while j < rn do begin arr[k] := rp[j]; Inc(j); Inc(k); end;
end;

procedure Timsort(var arr: TIntArray);
var
  n, i, size, left, mid, right: Integer;
begin
  n := Length(arr);
  i := 0;
  while i < n do begin
    InsertionSort(arr, i, Min(i + MIN_RUN - 1, n - 1));
    Inc(i, MIN_RUN);
  end;
  size := MIN_RUN;
  while size < n do begin
    left := 0;
    while left < n do begin
      mid := Min(left + size - 1, n - 1);
      right := Min(left + 2 * size - 1, n - 1);
      if mid < right then Merge(arr, left, mid, right);
      Inc(left, 2 * size);
    end;
    size := size * 2;
  end;
end;

var
  arr: TIntArray;
  i: Integer;

begin
  SetLength(arr, 9);
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9;
  arr[5] := 3; arr[6] := 7; arr[7] := 4; arr[8] := 6;
  Timsort(arr);
  for i := 0 to High(arr) do Write(IntToStr(arr[i]) + ' ');
  WriteLn;
end.
