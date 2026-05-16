let cocktailSort = (arr: array(int)) => {
  let n = Array.length(arr);
  let swapped = ref(true);
  let start = ref(0);
  let ending = ref(n - 1);
  while (swapped^) {
    swapped := false;
    for (i in start^ to ending^ - 1) {
      if (arr[i] > arr[i + 1]) {
        let tmp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = tmp;
        swapped := true;
      };
    };
    if (!swapped^) {
      swapped := false;
      ending := ending^ - 1;
      let i = ref(ending^ - 1);
      while (i^ >= start^) {
        if (arr[i^] > arr[i^ + 1]) {
          let tmp = arr[i^];
          arr[i^] = arr[i^ + 1];
          arr[i^ + 1] = tmp;
          swapped := true;
        };
        i := i^ - 1;
      };
      start := start^ + 1;
    };
  };
  arr;
};
