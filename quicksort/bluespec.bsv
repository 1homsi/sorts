package Quicksort;

import Vector::*;

function Action quicksort(Reg#(Vector#(7, Int#(32))) arr, Int#(32) low, Int#(32) high);
    action
        if (low < high) begin
            Int#(32) pivot = arr[high];
            Int#(32) i = low;
            for (Int#(32) j = low; j < high; j = j + 1) begin
                if (arr[j] <= pivot) begin
                    Int#(32) tmp = arr[i];
                    arr[i] <= arr[j];
                    arr[j] <= tmp;
                    i = i + 1;
                end
            end
            Int#(32) tmp = arr[i];
            arr[i] <= arr[high];
            arr[high] <= tmp;
        end
    endaction
endfunction

endpackage
