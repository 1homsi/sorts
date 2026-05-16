let cycleSort = (arr: array(int)): int => {
  let writes = ref(0);
  let n = Array.length(arr);
  for (cycleStart in 0 to n - 2) {
    let item = ref(arr[cycleStart]);
    let pos = ref(cycleStart);
    for (i in cycleStart + 1 to n - 1) {
      if (arr[i] < item^) { pos := pos^ + 1 }
    };
    if (pos^ != cycleStart) {
      while (item^ == arr[pos^]) { pos := pos^ + 1 };
      let tmp = arr[pos^];
      arr[pos^] = item^;
      item := tmp;
      writes := writes^ + 1;
      while (pos^ != cycleStart) {
        pos := cycleStart;
        for (i in cycleStart + 1 to n - 1) {
          if (arr[i] < item^) { pos := pos^ + 1 }
        };
        while (item^ == arr[pos^]) { pos := pos^ + 1 };
        let t = arr[pos^];
        arr[pos^] = item^;
        item := t;
        writes := writes^ + 1
      }
    }
  };
  writes^
};

let arr = [|5, 4, 3, 2, 1|];
let _ = cycleSort(arr);
Array.iter(x => print_int(x), arr);
print_newline();
