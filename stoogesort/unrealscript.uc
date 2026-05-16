static function Stoogesort(out Arr, I, J) {
  local int Temp, T;
  if (Arr[J] < Arr[I]) {
    Temp = Arr[J];
    Arr[J] = Arr[I];
    Arr[I] = Temp;
  }
  if (J - I > 1) {
    T = (J - I + 1) / 3;
    Stoogesort(Arr, I, J - T);
    Stoogesort(Arr, I + T, J);
    Stoogesort(Arr, I, J - T);
  }
}

simulated event BeginPlay() {
  local array<int> Arr;
  Arr[0] = 5; Arr[1] = 2; Arr[2] = 8;
  Arr[3] = 1; Arr[4] = 9; Arr[5] = 3;
  Stoogesort(Arr, 0, 5);
  Log(Arr);
}
