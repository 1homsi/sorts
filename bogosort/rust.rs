fn bogosort(arr: &mut [i32]) {
    while !arr.windows(2).all(|w| w[0] <= w[1]) {
        for i in (1..arr.len()).rev() {
            let j = rand::random::<usize>() % (i + 1);
            arr.swap(i, j);
        }
    }
}
