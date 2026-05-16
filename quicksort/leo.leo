program quicksort.aleo {
    transition partition(arr: [u32; 7], low: u32, high: u32) -> (u32, [u32; 7]) {
        let pivot: u32 = arr[high];
        let mut i: u32 = low;
        let mut result: [u32; 7] = arr;
        for j: u32 in low..high {
            if result[j] <= pivot {
                let tmp: u32 = result[i];
                result[i] = result[j];
                result[j] = tmp;
                i += 1u32;
            }
        }
        let tmp: u32 = result[i];
        result[i] = result[high];
        result[high] = tmp;
        return (i, result);
    }

    transition sort(input: [u32; 7]) -> [u32; 7] {
        let (p, arr): (u32, [u32; 7]) = partition(input, 0u32, 6u32);
        return arr;
    }
}
