program BucketSort;

type
  TFloatArray = array of Double;
  TBucket = array of Double;
  TBuckets = array of TBucket;

procedure InsertionSort(var bucket: TBucket);
var
  i, j: Integer;
  key: Double;
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

function BucketSortArr(arr: TFloatArray): TFloatArray;
var
  n, i, idx, pos: Integer;
  minV, maxV, num: Double;
  buckets: TBuckets;
begin
  n := Length(arr);
  if n = 0 then begin Result := arr; Exit; end;
  minV := arr[0]; maxV := arr[0];
  for i := 0 to n - 1 do begin
    if arr[i] < minV then minV := arr[i];
    if arr[i] > maxV then maxV := arr[i];
  end;
  SetLength(buckets, n);
  for i := 0 to n - 1 do SetLength(buckets[i], 0);
  for i := 0 to n - 1 do begin
    num := arr[i];
    idx := Trunc((num - minV) / (maxV - minV + 1) * n);
    if idx >= n then idx := n - 1;
    SetLength(buckets[idx], Length(buckets[idx]) + 1);
    buckets[idx][High(buckets[idx])] := num;
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
  data: TFloatArray;
  sorted: TFloatArray;
  i: Integer;
begin
  data := TFloatArray.Create(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68);
  sorted := BucketSortArr(data);
  for i := 0 to High(sorted) do
    Write(sorted[i]:4:2, ' ');
  WriteLn;
end.
