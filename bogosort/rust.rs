use rand::seq::SliceRandom;
use rand::thread_rng;

fn is_sorted(arr: &[i32]) -> bool {
    arr.windows(2).all(|w| w[0] <= w[1])
}

fn bogosort(arr: &mut Vec<i32>) {
    let mut rng = thread_rng();
    while !is_sorted(arr) {
        arr.shuffle(&mut rng);
    }
}

fn main() {
    let mut arr = vec![3, 1, 4, 1, 5, 9, 2, 6];
    bogosort(&mut arr);
    println!("{:?}", arr);
}
