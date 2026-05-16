let compareAndSwap = (arr, i, j, direction) => {
  let ai = arr[i];
  let aj = arr[j];
  if (direction == (ai > aj)) {
    arr[i] = aj;
    arr[j] = ai;
  };
};

let rec bitonicMerge = (arr, lo, cnt, direction) => {
  if (cnt > 1) {
    let k = cnt / 2;
    for (i in lo to lo + k - 1) {
      compareAndSwap(arr, i, i + k, direction);
    };
    bitonicMerge(arr, lo, k, direction);
    bitonicMerge(arr, lo + k, k, direction);
  };
};

let rec bitonicSort = (arr, lo, cnt, direction) => {
  if (cnt > 1) {
    let k = cnt / 2;
    bitonicSort(arr, lo, k, true);
    bitonicSort(arr, lo + k, k, false);
    bitonicMerge(arr, lo, cnt, direction);
  };
};

let data = [|3, 7, 4, 8, 6, 2, 1, 5|];
bitonicSort(data, 0, Array.length(data), true);
Array.iter(x => print_int(x) |> (_ => print_char(' ')), data);
print_newline();
