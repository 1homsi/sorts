module: radix-sort

define function get-digit(x :: <integer>, exp :: <integer>) => (d :: <integer>)
  modulo(floor/(x, exp), 10)
end;

define function counting-sort(arr :: <vector>, exp :: <integer>) => (out :: <vector>)
  let n = size(arr);
  let count = make(<vector>, size: 10, fill: 0);
  let output = make(<vector>, size: n, fill: 0);
  for (x in arr)
    let idx = get-digit(x, exp);
    count[idx] := count[idx] + 1;
  end;
  for (i from 1 below 10)
    count[i] := count[i] + count[i - 1];
  end;
  for (i from n - 1 to 0 by -1)
    let idx = get-digit(arr[i], exp);
    count[idx] := count[idx] - 1;
    output[count[idx]] := arr[i];
  end;
  output
end;

define function radix-sort(arr :: <vector>) => (out :: <vector>)
  if (empty?(arr)) arr
  else
    let max-val = reduce(max, arr[0], arr);
    let result = arr;
    let exp = 1;
    while (floor/(max-val, exp) > 0)
      result := counting-sort(result, exp);
      exp := exp * 10;
    end;
    result
  end
end;

let arr = vector(170, 45, 75, 90, 802, 24, 2, 66);
format-out("%=\n", radix-sort(arr));
