package timsort

import future.keywords.in

default min_run = 32

insertion_sort(arr) = sorted {
    n := count(arr)
    sorted := sort(arr)
}

merge_two(xs, ys) = merged {
    merged := sort(array.concat(xs, ys))
}

chunks_of(n, arr) = chunks {
    total := count(arr)
    indices := [i | i := numbers.range(0, total-1)[_]; i % n == 0]
    chunks := [chunk |
        start := indices[_]
        end := min([start + n, total])
        chunk := array.slice(arr, start, end)
    ]
}

merge_all(chunks) = result {
    count(chunks) == 1
    result := chunks[0]
}

merge_all(chunks) = result {
    count(chunks) > 1
    pairs := [m |
        i := numbers.range(0, count(chunks)-1)[_]
        i % 2 == 0
        j := i + 1
        j < count(chunks)
        m := merge_two(chunks[i], chunks[j])
    ]
    leftover := [chunks[i] |
        i := count(chunks) - 1
        count(chunks) % 2 == 1
    ]
    new_chunks := array.concat(pairs, leftover)
    result := merge_all(new_chunks)
}

timsort(arr) = sorted {
    cks := chunks_of(min_run, arr)
    isorted := [insertion_sort(c) | c := cks[_]]
    sorted := merge_all(isorted)
}

result := timsort([5, 2, 8, 1, 9, 3, 7, 4, 6])
