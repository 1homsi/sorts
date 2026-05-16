let combSort = (arr: array(int)): array(int) => {
  let n = Array.length(arr);
  let gap = ref(n);
  let sorted = ref(false);
  while (!sorted^) {
    gap := int_of_float(float_of_int(gap^) /. 1.3);
    if (gap^ <= 1) {
      gap := 1;
      sorted := true;
    };
    let i = ref(0);
    while (i^ + gap^ < n) {
      if (arr[i^] > arr[i^ + gap^]) {
        let tmp = arr[i^];
        arr[i^] = arr[i^ + gap^];
        arr[i^ + gap^] = tmp;
        sorted := false;
      };
      incr(i);
    };
  };
  arr;
};
