let getDigit = (x, exp) => mod(x / exp, 10)

let countingSort = (arr, exp) =>
    Belt.Array.concatMany(
        Belt.Array.makeBy(10, d =>
            Belt.Array.keep(arr, x => getDigit(x, exp) == d)
        )
    )

let rec radixSortLoop = (arr, maxVal, exp) =>
    if maxVal / exp == 0 { arr }
    else { radixSortLoop(countingSort(arr, exp), maxVal, exp * 10) }

let radixSort = arr =>
    if Belt.Array.length(arr) == 0 { arr }
    else {
        let maxVal = Belt.Array.reduce(arr, 0, (acc, x) => max(acc, x))
        radixSortLoop(arr, maxVal, 1)
    }

let arr = [|170, 45, 75, 90, 802, 24, 2, 66|]
let sorted = radixSort(arr)
Js.log(sorted)
