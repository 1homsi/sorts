insertionsort(a: array of int): array of int
{
  n := len a;
  for(i := 1; i < n; i++)
  {
    key := a[i];
    j := i - 1;
    while(j >= 0 && a[j] > key)
    {
      a[j+1] = a[j];
      j--;
    }
    a[j+1] = key;
  }
  return a;
}

impl Module {
  init(nil: ref Draw->Context, d: ref Draw->Display) {}
};

print(string insertionsort(array of {5, 2, 8, 1, 9, 3}));