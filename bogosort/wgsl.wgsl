var<private> arr: array<i32, 8> = array<i32, 8>(3, 1, 4, 1, 5, 9, 2, 6);
var<private> seed: u32 = 42u;

fn lcg_rand() -> u32 {
    seed = seed * 1664525u + 1013904223u;
    return seed;
}

fn is_sorted() -> bool {
    for (var i: i32 = 0; i < 7; i++) {
        if (arr[i] > arr[i + 1]) { return false; }
    }
    return true;
}

fn shuffle() {
    for (var i: i32 = 7; i > 0; i--) {
        let j = i32(lcg_rand() % u32(i + 1));
        let tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

@compute @workgroup_size(1)
fn bogosort() {
    loop {
        if (is_sorted()) { break; }
        shuffle();
    }
}
