process = bitonicsort;

bitonicsort(x) = bitonicsort_helper(x, 0, 8, 1);

bitonicsort_helper(x, lo, cnt, dir) =
    cnt > 1 ?
    bitonicmerge_helper(
        bitonicsort_helper(
            bitonicsort_helper(x, lo, cnt/2, 1),
            lo + cnt/2, cnt/2, 0),
        lo, cnt, dir) : x;

bitonicmerge_helper(x, lo, cnt, dir) =
    cnt > 1 ?
    bitonicmerge_helper(
        bitonicmerge_helper(
            swap_if_needed(x, lo, cnt/2, dir),
            lo, cnt/2, dir),
        lo + cnt/2, cnt/2, dir) : x;

swap_if_needed(x, lo, k, dir) =
    ((x@(lo) > x@(lo + k)) == (dir == 1)) ?
    swap_at(x, lo, lo + k) : x;

swap_at(x, i, j) = x';
