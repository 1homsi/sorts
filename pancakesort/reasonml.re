let flip = (arr, k) => {
  let left = ref(0);
  let right = ref(k);
  while (left^ < right^) {
    let tmp = arr[left^];
    arr[left^] = arr[right^];
    arr[right^] = tmp;
    left := left^ + 1;
    right := right^ - 1;
  };
};

let findMaxIdx = (arr, size) => {
  let maxIdx = ref(0);
  for (i in 1 to size - 1) {
    if (arr[i] > arr[maxIdx^]) {
      maxIdx := i;
    };
  };
  maxIdx^;
};

let pancakeSort = arr => {
  let size = ref(Array.length(arr));
  while (size^ > 1) {
    let mi = findMaxIdx(arr, size^);
    if (mi != size^ - 1) {
      if (mi != 0) { flip(arr, mi); };
      flip(arr, size^ - 1);
    };
    size := size^ - 1;
  };
  arr;
};

let arr = [|3, 6, 2, 7, 4, 1, 5|];
let _ = pancakeSort(arr);
Array.iter(x => print_int(x), arr);
print_newline();
