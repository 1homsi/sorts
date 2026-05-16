program BucketSort;
var arr: array[1..6] of integer = (5, 2, 8, 1, 9, 3);
var buckets: array[1..10] of integer;
var result: array[1..6] of integer;
var i, idx: integer;

procedure SortBuckets;
begin
  for i := 1 to 10 do
    buckets[i] := 0;
  for i := 1 to 6 do
    buckets[arr[i]] := arr[i];
  idx := 0;
  for i := 1 to 10 do
    if buckets[i] > 0 then begin
      idx := idx + 1;
      result[idx] := buckets[i];
    end;
end;

begin
  SortBuckets;
  WriteLn(result);
end.