import("stdfaust.lib");

heapsort = environment {
    heapsort(n) = heap_sort(n, 0, n-1)
        with {
            heap_sort(n, i, bound) = if (i > bound) then n
                else heap_sort(siftdown(n, i, bound), i+1, bound);
            
            siftdown(n, idx, bound) = if (largest == idx) then n
                else siftdown(swap_at(n, idx, largest), largest, bound)
                with {
                    largest = max_child(idx, bound);
                    max_child(idx, b) = if (left > b) then idx
                        else if (right > b) then
                            (n_at(left) > n_at(largest) ? left : largest)
                        else
                            (n_at(right) > n_at(left) ? 
                                (n_at(right) > n_at(largest) ? right : largest) :
                                (n_at(left) > n_at(largest) ? left : largest))
                        with {
                            left = 2 * idx + 1;
                            right = 2 * idx + 2;
                        };
                };
            
            n_at(i) = ba.take(i+1, n) : ba.last;
            swap_at(n, i, j) = ba.replace(i, ba.take(j+1, n) : ba.last, 
                             ba.replace(j, ba.take(i+1, n) : ba.last, n));
        };
};

process = heapsort(hslider("v:array", 0, 0, 100, 1)) : si.smoo;
