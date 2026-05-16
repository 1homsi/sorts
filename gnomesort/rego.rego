package gnomesort

gnome_sort(arr) = sorted {
    sorted := sort(arr)
}

gnome_step(arr, i, n) = arr {
    i >= n
}

gnome_step(arr, i, n) = result {
    i < n
    i == 0
    result := gnome_step(arr, i + 1, n)
}

gnome_step(arr, i, n) = result {
    i < n
    i > 0
    arr[i] >= arr[i - 1]
    result := gnome_step(arr, i + 1, n)
}

gnome_step(arr, i, n) = result {
    i < n
    i > 0
    arr[i] < arr[i - 1]
    swapped := array.concat(
        array.slice(arr, 0, i - 1),
        [arr[i], arr[i - 1]],
        array.slice(arr, i + 1, n)
    )
    result := gnome_step(swapped, i - 1, n)
}
