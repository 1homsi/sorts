program MergeSort;

{$APPTYPE CONSOLE}

uses SysUtils;

procedure Merge(var A: array of Integer; Lo, Mid, Hi: Integer);
var
  Tmp: array of Integer;
  I, J, K: Integer;
begin
  SetLength(Tmp, Hi - Lo + 1);
  I := Lo; J := Mid + 1; K := 0;
  while (I <= Mid) and (J <= Hi) do begin
    if A[I] <= A[J] then begin Tmp[K] := A[I]; Inc(I); end
    else begin Tmp[K] := A[J]; Inc(J); end;
    Inc(K);
  end;
  while I <= Mid do begin Tmp[K] := A[I]; Inc(I); Inc(K); end;
  while J <= Hi do begin Tmp[K] := A[J]; Inc(J); Inc(K); end;
  for I := Lo to Hi do A[I] := Tmp[I - Lo];
end;

procedure MergeSort(var A: array of Integer; Lo, Hi: Integer);
var Mid: Integer;
begin
  if Lo >= Hi then Exit;
  Mid := (Lo + Hi) div 2;
  MergeSort(A, Lo, Mid);
  MergeSort(A, Mid + 1, Hi);
  Merge(A, Lo, Mid, Hi);
end;

var
  Arr: array of Integer;
  I: Integer;
begin
  Arr := TArray<Integer>.Create(38, 27, 43, 3, 9, 82, 10);
  MergeSort(Arr, 0, High(Arr));
  for I := 0 to High(Arr) do Write(Arr[I], ' ');
  Writeln;
end.
