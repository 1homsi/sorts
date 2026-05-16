function GnomeSort(array<int> arr)
{
  local int i;
  local int temp;

  i = 0;
  while (i < arr.Length) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      temp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }

  return arr;
}

function Test() {
  local array<int> test;
  test.Add(5);
  test.Add(2);
  test.Add(8);
  test.Add(1);
  test.Add(9);
  test.Add(3);

  GnomeSort(test);
  `log test;
}
