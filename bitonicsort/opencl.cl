__kernel void bitonic_merge_step(__global int* arr, int lo, int k, int direction) {
    int i = lo + get_global_id(0);
    if (i < lo + k) {
        int ai = arr[i];
        int aj = arr[i + k];
        bool dir = (bool)direction;
        if (dir == (ai > aj)) {
            arr[i] = aj;
            arr[i + k] = ai;
        }
    }
}
