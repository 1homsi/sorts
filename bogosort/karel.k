program bogosort

var arr : array 1..3 of integer
var i, j, n, tmp, sorted : integer

begin
  arr[1] := 3
  arr[2] := 1
  arr[3] := 2
  n := 3
  sorted := 0

  while sorted = 0 do
    sorted := 1
    for i := 1 to n - 1 do
      if arr[i] > arr[i + 1] then
        sorted := 0
      endif
    endfor

    if sorted = 0 then
      for i := 1 to n do
        j := random(n) + 1
        tmp := arr[i]
        arr[i] := arr[j]
        arr[j] := tmp
      endfor
    endif
  endwhile

  for i := 1 to n do
    write(arr[i])
  endfor
end
