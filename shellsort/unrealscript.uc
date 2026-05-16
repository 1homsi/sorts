function ShellSort(out Arr)
{
  local int N, Gap, I, J, Temp;
  N = Arr.Length;
  Gap = 1;
  while (Gap <= N) Gap = Gap * 3 + 1;
  while (Gap > 0) {
    Gap = Gap / 3;
    for (I = Gap; I < N; I++) {
      Temp = Arr[I];
      J = I;
      while (J >= Gap && Arr[J - Gap] > Temp) {
        Arr[J] = Arr[J - Gap];
        J -= Gap;
      }
      Arr[J] = Temp;
    }
  }
}
var int Arr[6];
Arr[0] = 5; Arr[1] = 2; Arr[2] = 8; Arr[3] = 1; Arr[4] = 9; Arr[5] = 3;
ShellSort(Arr);
log(Arr);
