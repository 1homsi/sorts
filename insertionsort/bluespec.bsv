package InsertionSort;

import Vector::*;

function Vector#(n, Int#(32)) insertionSort(Vector#(n, Int#(32)) arr);
    Vector#(n, Int#(32)) result = arr;
    Integer sz = valueOf(n);
    for (Integer i = 1; i < sz; i = i + 1) begin
        Int#(32) key = result[i];
        Integer j = i - 1;
        while (j >= 0 && result[j] > key) begin
            result[j+1] = result[j];
            j = j - 1;
        end
        result[j+1] = key;
    end
    return result;
endfunction

endpackage
