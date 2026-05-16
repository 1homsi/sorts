class BogSort extends Actor;

function array<int> Bogosort(array<int> Arr) {
  while (!IsSorted(Arr)) {
    Shuffle(Arr);
  }
  return Arr;
}

function bool IsSorted(array<int> Arr) {
  local int i;
  for (i = 0; i < Arr.Length - 1; i++) {
    if (Arr[i] > Arr[i+1]) {
      return false;
    }
  }
  return true;
}

function Shuffle(array<int> Arr) {
  local int i, j, tmp;
  for (i = 0; i < Arr.Length; i++) {
    j = Rand() % Arr.Length;
    tmp = Arr[i];
    Arr[i] = Arr[j];
    Arr[j] = tmp;
  }
}

event PostBeginPlay() {
  local array<int> Arr;
  Arr[0] = 3;
  Arr[1] = 1;
  Arr[2] = 2;
  Log(Bogosort(Arr));
}
