fn bubble_sort(arr: &mut Vec<i32>) {
    let n = arr.len();
    let mut swapped;
    let mut end = n;
    loop {
        swapped = false;
        for i in 0..end - 1 {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                swapped = true;
            }
        }
        end -= 1;
        if !swapped {
            break;
        }
    }
}

fn main() {
    let mut arr = vec![64, 34, 25, 12, 22, 11, 90];
    bubble_sort(&mut arr);
    println!("{:?}", arr);
}
