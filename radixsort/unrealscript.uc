function array<int> RadixSort(array<int> Arr) {
  local int Max, Exp;
  local int i;
  Max = 0;
  for (i = 0; i < Arr.Length; i++) {
    if (Arr[i] > Max) Max = Arr[i];
  }
  Exp = 1;
  while (Max / Exp > 0) {
    Arr = CountingSortByExp(Arr, Exp);
    Exp *= 10;
  }
  return Arr;
}

function array<int> CountingSortByExp(array<int> Arr, int Exp) {
  local array<int> Output, Count;
  local int N, i, idx;
  N = Arr.Length;
  Output.Length = N;
  Count.Length = 10;
  for (i = 0; i < 10; i++) Count[i] = 0;
  for (i = 0; i < N; i++) {
    idx = (Arr[i] / Exp) % 10;
    Count[idx]++;
  }
  for (i = 1; i < 10; i++) Count[i] += Count[i - 1];
  for (i = N - 1; i >= 0; i--) {
    idx = (Arr[i] / Exp) % 10;
    Output[Count[idx] - 1] = Arr[i];
    Count[idx]--;
  }
  return Output;
}

$log(RadixSort([5, 2, 8, 1, 9, 3]));
