program Delphi;

{$APPTYPE CONSOLE}

uses SysUtils, Generics.Collections;

type
  TDoubleArray = TArray<Double>;

procedure InsertionSort(var bucket: TDoubleArray);
var i, j: Integer; key: Double;
begin
  for i := 1 to High(bucket) do begin
    key := bucket[i];
    j := i - 1;
    while (j >= 0) and (bucket[j] > key) do begin
      bucket[j + 1] := bucket[j];
      Dec(j);
    end;
    bucket[j + 1] := key;
  end;
end;

function BucketSort(arr: TDoubleArray): TDoubleArray;
var
  n, i, idx, pos: Integer;
  minV, maxV: Double;
  buckets: array of TDoubleArray;
begin
  n := Length(arr);
  if n = 0 then begin Result := arr; Exit; end;
  minV := arr[0]; maxV := arr[0];
  for i := 0 to n - 1 do begin
    if arr[i] < minV then minV := arr[i];
    if arr[i] > maxV then maxV := arr[i];
  end;
  SetLength(buckets, n);
  for i := 0 to n - 1 do begin
    idx := Trunc((arr[i] - minV) / (maxV - minV + 1) * n);
    if idx >= n then idx := n - 1;
    SetLength(buckets[idx], Length(buckets[idx]) + 1);
    buckets[idx][High(buckets[idx])] := arr[i];
  end;
  SetLength(Result, n);
  pos := 0;
  for i := 0 to n - 1 do begin
    InsertionSort(buckets[i]);
    for idx := 0 to High(buckets[i]) do begin
      Result[pos] := buckets[i][idx];
      Inc(pos);
    end;
  end;
end;

var
  data, sorted: TDoubleArray;
  i: Integer;
begin
  data := [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
  sorted := BucketSort(data);
  for i := 0 to High(sorted) do
    Write(Format('%.2f ', [sorted[i]]));
  WriteLn;
end.
