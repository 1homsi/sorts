function bogosort(arr) {
  while (!issorted(arr)) {
    shuffle(arr);
  }
  return arr;
}

function issorted(arr) {
  for (local i = 0; i < arr.len() - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      return false;
    }
  }
  return true;
}

function shuffle(arr) {
  for (local i = 0; i < arr.len(); i++) {
    local j = rand() % arr.len();
    local tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

local arr = [3, 1, 2];
print(bogosort(arr) + "
");
