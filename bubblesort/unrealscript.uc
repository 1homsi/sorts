class BubbleSort extends Object;

static final function BubbleSortArray(out arr<int> Array)
{
  local int n, i, j, temp;
  n = Array.Length;
  for (i = 0; i < n; i++)
  {
    for (j = 0; j < n - 1 - i; j++)
    {
      if (Array[j] > Array[j+1])
      {
        temp = Array[j];
        Array[j] = Array[j+1];
        Array[j+1] = temp;
      }
    }
  }
}

defaultproperties
{
}
function test() {
  local array<int> arr;
  arr[0]=5; arr[1]=2; arr[2]=8; arr[3]=1; arr[4]=9; arr[5]=3;
  BubbleSortArray(arr);
}