let stoogeSort = (arr: array<int>, first: int, last: int): array<int> => {
    let a = arr->Belt.Array.copy
    let rec sort = (first, last) => {
        if a[first] > a[last] {
            let tmp = a[first]
            a[first] = a[last]
            a[last] = tmp
        }
        let n = last - first + 1
        if n > 2 {
            let t = n * 2 / 3
            sort(first, first + t - 1)
            sort(last - t + 1, last)
            sort(first, first + t - 1)
        }
    }
    sort(first, last)
    a
}

let arr = [3, 1, 4, 1, 5, 9, 2, 6]
let sorted = stoogeSort(arr, 0, Belt.Array.length(arr) - 1)
Js.log(sorted)
