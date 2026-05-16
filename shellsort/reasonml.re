let shellSort = (arr: array(int)): array(int) => {
  let n = Array.length(arr);
  let gap = ref(n / 2);
  while (gap^ > 0) {
    for (i in gap^ to n - 1) {
      let temp = arr[i];
      let j = ref(i);
      while (j^ >= gap^ && arr[j^ - gap^] > temp) {
        arr[j^] = arr[j^ - gap^];
        j := j^ - gap^;
      };
      arr[j^] = temp;
    };
    gap := gap^ / 2;
  };
  arr;
};

let arr = [|64, 34, 25, 12, 22, 11, 90|];
let sorted = shellSort(arr);
Array.iter(x => Js.log(x), sorted);
