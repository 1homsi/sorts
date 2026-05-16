let isSorted = arr => {
  let n = Array.length(arr);
  let sorted = ref(true);
  for (i in 0 to n - 2) {
    if (arr[i] > arr[i + 1]) {
      sorted := false;
    };
  };
  sorted^;
};

let shuffle = arr => {
  let a = Array.copy(arr);
  let n = Array.length(a);
  for (i in 0 to n - 2) {
    let i = n - 1 - i;
    let j = Random.int(i + 1);
    let tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
  };
  a;
};

let rec bogosort = arr => {
  if (isSorted(arr)) {
    arr;
  } else {
    bogosort(shuffle(arr));
  };
};

let arr = [|3, 1, 4, 1, 5, 9, 2, 6|];
let sorted = bogosort(arr);
Array.iter(v => Printf.printf("%d ", v), sorted);
print_newline();
