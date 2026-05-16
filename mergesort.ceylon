shared {Integer*} merge({Integer*} left, {Integer*} right) {
    if (left.empty) { return right; }
    if (right.empty) { return left; }
    value l = left.first else 0;
    value r = right.first else 0;
    if (l <= r) {
        return { l, *merge(left.rest, right) };
    } else {
        return { r, *merge(left, right.rest) };
    }
}

shared {Integer*} mergesort({Integer*} arr) {
    value list = arr.sequence();
    if (list.size <= 1) { return list; }
    value mid = list.size / 2;
    value left = list[0:mid];
    value right = list[mid:list.size - mid];
    return merge(mergesort(left), mergesort(right));
}

shared void run() {
    print(mergesort({ 5, 2, 8, 1, 9, 3 }));
}
