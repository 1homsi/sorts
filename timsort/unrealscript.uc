class TimSort extends Object;

static function array<int> TimSort(array<int> Arr, optional int MinSize)
{
  return MergeSort(Arr, MinSize);
}

static function array<int> MergeSort(array<int> Arr, optional int MinSize)
{
  local array<int> Left, Right, Result;
  local int Mid;
  
  if (MinSize == 0) MinSize = 32;
  
  if (Arr.length <= 1) return Arr;
  if (Arr.length <= MinSize) return InsertionSort(Arr);
  
  Mid = Arr.length / 2;
  Left = Arr;
  Left.Remove(Mid, Arr.length - Mid);
  Right = Arr;
  Right.Remove(0, Mid);
  
  return Merge(MergeSort(Left, MinSize), MergeSort(Right, MinSize));
}

static function array<int> InsertionSort(array<int> Arr)
{
  local array<int> Result;
  local int i, j, Key;
  
  Result = Arr;
  
  for (i = 1; i < Result.length; i++) {
    Key = Result[i];
    j = i - 1;
    while (j >= 0 && Result[j] > Key) {
      Result[j + 1] = Result[j];
      j--;
    }
    Result[j + 1] = Key;
  }
  
  return Result;
}

static function array<int> Merge(array<int> Left, array<int> Right)
{
  local array<int> Result;
  local int i, j;
  
  i = 0; j = 0;
  
  while (i < Left.length && j < Right.length) {
    if (Left[i] <= Right[j]) {
      Result.AddItem(Left[i]);
      i++;
    } else {
      Result.AddItem(Right[j]);
      j++;
    }
  }
  
  while (i < Left.length) {
    Result.AddItem(Left[i]);
    i++;
  }
  while (j < Right.length) {
    Result.AddItem(Right[j]);
    j++;
  }
  
  return Result;
}

defaultproperties
{
}
