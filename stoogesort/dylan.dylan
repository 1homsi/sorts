module: stooge-sort

define function stooge-sort(arr :: <vector>, first :: <integer>, last :: <integer>) => ()
    if (arr[first] > arr[last])
        let tmp = arr[first];
        arr[first] := arr[last];
        arr[last] := tmp;
    end if;
    let n = last - first + 1;
    if (n > 2)
        let t = floor/(n * 2, 3);
        stooge-sort(arr, first, first + t - 1);
        stooge-sort(arr, last - t + 1, last);
        stooge-sort(arr, first, first + t - 1);
    end if;
end function;

let arr = make(<vector>, size: 8);
arr[0] := 3; arr[1] := 1; arr[2] := 4; arr[3] := 1;
arr[4] := 5; arr[5] := 9; arr[6] := 2; arr[7] := 6;
stooge-sort(arr, 0, 7);
format-out("%=\n", arr);
