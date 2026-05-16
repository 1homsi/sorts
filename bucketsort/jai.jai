main :: () {
    arr := int.[5, 2, 8, 1, 9, 3];
    buckets := make_dynamic_array(int);
    for i : 0..9 {
        array_add(*buckets, 0);
    }
    for num in arr {
        if num >= 0 && num < 10 {
            buckets[num] += 1;
        }
    }
    result := make_dynamic_array(int);
    for i : 0..9 {
        for j : 0..buckets[i] - 1 {
            array_add(*result, i);
        }
    }
    print("%", result);
}