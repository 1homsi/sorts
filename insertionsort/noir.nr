fn insertion_sort(arr: [Field; 5]) -> [Field; 5] {
    let mut a = arr;
    for i in 1..5 {
        let key = a[i];
        let mut j = i;
        for _k in 0..5 {
            if j > 0 {
                if a[j - 1] as u64 > key as u64 {
                    a[j] = a[j - 1];
                    j -= 1;
                }
            }
        }
        a[j] = key;
    }
    a
}

fn main() {
    let arr = [5, 3, 1, 4, 2];
    let sorted = insertion_sort(arr);
    assert(sorted[0] == 1);
    assert(sorted[4] == 5);
}
