function SelectionSort(array<int> Arr) {
  local int N, I, J, MinIdx, Tmp;
  N = Arr.Length;
  for (I = 0; I < N - 1; I++) {
    MinIdx = I;
    for (J = I + 1; J < N; J++) {
      if (Arr[J] < Arr[MinIdx]) {
        MinIdx = J;
      }
    }
    Tmp = Arr[I];
    Arr[I] = Arr[MinIdx];
    Arr[MinIdx] = Tmp;
  }
  return Arr;
}

DefaultProperties {
  Begin Object Class=Sequence Name=Level
  End Object
}