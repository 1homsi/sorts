module bogosort;
import std::io;
import std::math::random;

fn bool is_sorted(int[] arr) {
    for (int i = 0; i < arr.len - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

fn void shuffle(int[] arr) {
    Random rng;
    rng.seed(time::now());
    for (int i = (int)arr.len - 1; i > 0; i--) {
        int j = (int)(rng.next_uint() % (uint)(i + 1));
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

fn void bogosort(int[] arr) {
    while (!is_sorted(arr)) shuffle(arr);
}

fn void main() {
    int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
    bogosort(arr);
    foreach (v : arr) io::printf("%d ", v);
    io::printn();
}
