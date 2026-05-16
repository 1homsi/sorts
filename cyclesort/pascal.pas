program CycleSort;

var
  arr: array[0..4] of Integer;
  n, cycleStart, item, pos, i, tmp, writes: Integer;

begin
  arr[0] := 5; arr[1] := 4; arr[2] := 3; arr[3] := 2; arr[4] := 1;
  n := 5;
  writes := 0;
  for cycleStart := 0 to n - 2 do
  begin
    item := arr[cycleStart];
    pos := cycleStart;
    for i := cycleStart + 1 to n - 1 do
      if arr[i] < item then Inc(pos);
    if pos = cycleStart then Continue;
    while item = arr[pos] do Inc(pos);
    tmp := arr[pos]; arr[pos] := item; item := tmp;
    Inc(writes);
    while pos <> cycleStart do
    begin
      pos := cycleStart;
      for i := cycleStart + 1 to n - 1 do
        if arr[i] < item then Inc(pos);
      while item = arr[pos] do Inc(pos);
      tmp := arr[pos]; arr[pos] := item; item := tmp;
      Inc(writes);
    end;
  end;
  for i := 0 to n - 1 do Write(arr[i], ' ');
  Writeln;
end.
