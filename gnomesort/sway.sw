library;

pub fn gnome_sort(arr: Vec<u64>) -> Vec<u64> {
    let mut a = arr;
    let n = a.len();
    let mut i = 0u64;
    while i < n {
        if i == 0 || a.get(i).unwrap() >= a.get(i - 1).unwrap() {
            i += 1;
        } else {
            let cur = a.get(i).unwrap();
            let prv = a.get(i - 1).unwrap();
            let _ = a.set(i, prv);
            let _ = a.set(i - 1, cur);
            i -= 1;
        }
    }
    a
}
