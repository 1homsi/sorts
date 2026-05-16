program insertion_sort.aleo {

    transition sort(arr: [u32; 5]) -> [u32; 5] {
        let a: [u32; 5] = arr;
        for i: u8 in 1u8..5u8 {
            let key: u32 = a[i];
            let j: u8 = i - 1u8;
            for _k: u8 in 0u8..5u8 {
                if j < 255u8 && a[j] > key {
                    a[j + 1u8] = a[j];
                    j -= 1u8;
                }
            }
            a[j + 1u8] = key;
        }
        return a;
    }
}
