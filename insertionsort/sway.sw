script;

fn insert(x: u64, arr: Vec<u64>) -> Vec<u64> {
    let mut result: Vec<u64> = Vec::new();
    let mut inserted = false;
    let mut i = 0;
    while i < arr.len() {
        if !inserted && x <= arr.get(i).unwrap() {
            result.push(x);
            inserted = true;
        }
        result.push(arr.get(i).unwrap());
        i += 1;
    }
    if !inserted {
        result.push(x);
    }
    result
}

fn insertion_sort(arr: Vec<u64>) -> Vec<u64> {
    let mut sorted: Vec<u64> = Vec::new();
    let mut i = 0;
    while i < arr.len() {
        sorted = insert(arr.get(i).unwrap(), sorted);
        i += 1;
    }
    sorted
}

fn main() -> Vec<u64> {
    let mut arr: Vec<u64> = Vec::new();
    arr.push(5);
    arr.push(3);
    arr.push(1);
    arr.push(4);
    arr.push(2);
    insertion_sort(arr)
}
