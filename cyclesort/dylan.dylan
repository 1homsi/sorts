Module: cycle-sort

define function cycle-sort (arr :: <vector>) => (writes :: <integer>)
  let writes = 0;
  let n = size(arr);
  for (cycle-start from 0 below n - 1)
    let item = arr[cycle-start];
    let pos = cycle-start;
    for (i from cycle-start + 1 below n)
      if (arr[i] < item) pos := pos + 1 end;
    end for;
    if (pos ~= cycle-start)
      while (item = arr[pos]) pos := pos + 1 end;
      let tmp = arr[pos];
      arr[pos] := item;
      item := tmp;
      writes := writes + 1;
      while (pos ~= cycle-start)
        pos := cycle-start;
        for (i from cycle-start + 1 below n)
          if (arr[i] < item) pos := pos + 1 end;
        end for;
        while (item = arr[pos]) pos := pos + 1 end;
        let t = arr[pos];
        arr[pos] := item;
        item := t;
        writes := writes + 1;
      end while;
    end if;
  end for;
  writes
end function;

let arr = vector(5, 4, 3, 2, 1);
cycle-sort(arr);
format-out("%=\n", arr);
