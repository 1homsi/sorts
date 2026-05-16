fn gnome_sort(arr: [Field; 10]) -> [Field; 10] {
    let mut a = arr;
    let n: u32 = 10;
    let mut i: u32 = 0;
    for _ in 0..100 {
        if i < n {
            if i == 0 {
                i += 1;
            } else if a[i] as u32 >= a[i-1] as u32 {
                i += 1;
            } else {
                let tmp = a[i];
                a[i] = a[i-1];
                a[i-1] = tmp;
                if i > 0 { i -= 1; }
            }
        }
    }
    a
}

fn main() {
    let arr: [Field; 10] = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0];
    let _ = gnome_sort(arr);
}
