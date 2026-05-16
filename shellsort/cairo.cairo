use array::ArrayTrait;

fn shell_sort(ref arr: Array<u32>) {
    let n = arr.len();
    let mut gap = n / 2;
    loop {
        if gap == 0 {
            break;
        }
        let mut i = gap;
        loop {
            if i >= n {
                break;
            }
            let temp = *arr.at(i);
            let mut j = i;
            loop {
                if j < gap {
                    break;
                }
                if *arr.at(j - gap) <= temp {
                    break;
                }
                let val = *arr.at(j - gap);
                arr.set(j, val);
                j -= gap;
            };
            arr.set(j, temp);
            i += 1;
        };
        gap /= 2;
    };
}
