implement Sort;
include "sys.m";
include "draw.m";

Sort: module {
    bucket_sort: fn(arr: array of int, max_val: int): array of int;
};

bucket_sort(arr: array of int, max_val: int): array of int {
    buckets := array[max_val] of {* => array of {* => 0}};
    for (i := 0; i < max_val; i++)
        buckets[i] = array[0] of int;
    for (i = 0; i < len arr; i++) {
        num := arr[i];
        if (num >= 0 && num < max_val) {
            nlen := len buckets[num];
            buckets[num] = array[nlen+1] of int;
            buckets[num][nlen] = num;
        }
    }
    result := array[len arr] of int;
    rlen := 0;
    for (i = 0; i < max_val; i++) {
        for (j = 0; j < len buckets[i]; j++) {
            result[rlen++] = buckets[i][j];
        }
    }
    return result;
}