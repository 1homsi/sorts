let gnomeSort = arr => {
  let n = Array.length(arr);
  let i = ref(0);
  while (i^ < n) {
    if (i^ == 0 || arr[i^] >= arr[i^ - 1]) {
      i := i^ + 1;
    } else {
      let tmp = arr[i^];
      arr[i^] = arr[i^ - 1];
      arr[i^ - 1] = tmp;
      i := i^ - 1;
    };
  };
  arr;
};
