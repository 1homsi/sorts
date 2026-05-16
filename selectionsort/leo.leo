program selection_sort.aleo {
    transition sort(arr: [u32; 5]) -> [u32; 5] {
        let mut result: [u32; 5] = arr;
        for i: u32 in 0u32..5u32 {
            let mut min_idx: u32 = i;
            for j: u32 in (i + 1u32)..5u32 {
                if result[j] < result[min_idx] {
                    min_idx = j;
                }
            }
            let tmp: u32 = result[i];
            result[i] = result[min_idx];
            result[min_idx] = tmp;
        }
        return result;
    }
}
