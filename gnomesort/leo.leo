program gnome_sort.aleo {
    function gnome_sort(arr: [u32; 10]) -> [u32; 10] {
        let mut a: [u32; 10] = arr;
        let mut i: u32 = 0u32;
        for _ in 0u8..100u8 {
            if i < 10u32 {
                if i == 0u32 {
                    i += 1u32;
                } else if a[i] >= a[i - 1u32] {
                    i += 1u32;
                } else {
                    let tmp: u32 = a[i];
                    a[i] = a[i - 1u32];
                    a[i - 1u32] = tmp;
                    if i > 0u32 { i -= 1u32; }
                }
            }
        }
        a
    }

    transition main() -> [u32; 10] {
        return gnome_sort([5u32, 3u32, 8u32, 1u32, 9u32, 2u32, 7u32, 4u32, 6u32, 0u32]);
    }
}
