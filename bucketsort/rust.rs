fn insertion_sort(bucket: &mut Vec<f64>) {
    let n = bucket.len();
    for i in 1..n {
        let key = bucket[i];
        let mut j = i;
        while j > 0 && bucket[j - 1] > key {
            bucket[j] = bucket[j - 1];
            j -= 1;
        }
        bucket[j] = key;
    }
}

fn bucket_sort(arr: &mut Vec<f64>) {
    let n = arr.len();
    if n == 0 { return; }
    let min = arr.iter().cloned().fold(f64::INFINITY, f64::min);
    let max = arr.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let mut buckets: Vec<Vec<f64>> = vec![vec![]; n];
    for &num in arr.iter() {
        let idx = ((num - min) / (max - min + 1.0) * n as f64) as usize;
        let idx = idx.min(n - 1);
        buckets[idx].push(num);
    }
    let mut i = 0;
    for bucket in &mut buckets {
        insertion_sort(bucket);
        for &val in bucket.iter() {
            arr[i] = val;
            i += 1;
        }
    }
}

fn main() {
    let mut data = vec![0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
    bucket_sort(&mut data);
    println!("{:?}", data);
}
