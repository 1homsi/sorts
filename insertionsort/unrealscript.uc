function InsertionSort(out Arr: array<int>)
{
  local int n, i, j, key;
  n = Arr.Length;
  for (i = 1; i < n; i++)
  {
    key = Arr[i];
    j = i - 1;
    while (j >= 0 && Arr[j] > key)
    {
      Arr[j+1] = Arr[j];
      j--;
    }
    Arr[j+1] = key;
  }
}

simulated event PostBeginPlay()
{
  local array<int> Arr;
  Arr[0] = 5; Arr[1] = 2; Arr[2] = 8; Arr[3] = 1; Arr[4] = 9; Arr[5] = 3;
  InsertionSort(Arr);
  `log(Arr);
}