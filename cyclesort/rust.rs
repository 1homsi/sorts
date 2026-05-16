fn cycle_sort(arr: &mut Vec<i32>) -> usize {
    let mut writes = 0;
    let n = arr.len();
    for cycle_start in 0..n.saturating_sub(1) {
        let mut item = arr[cycle_start];
        let mut pos = cycle_start;
        for i in (cycle_start + 1)..n {
            if arr[i] < item {
                pos += 1;
            }
        }
        if pos == cycle_start {
            continue;
        }
        while item == arr[pos] {
            pos += 1;
        }
        std::mem::swap(&mut arr[pos], &mut item);
        writes += 1;
        while pos != cycle_start {
            pos = cycle_start;
            for i in (cycle_start + 1)..n {
                if arr[i] < item {
                    pos += 1;
                }
            }
            while item == arr[pos] {
                pos += 1;
            }
            std::mem::swap(&mut arr[pos], &mut item);
            writes += 1;
        }
    }
    writes
}

fn main() {
    let mut arr = vec![5, 4, 3, 2, 1];
    cycle_sort(&mut arr);
    println!("{:?}", arr);
}
