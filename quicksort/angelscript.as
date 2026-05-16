array<int> quicksort(array<int> arr) {
  if (arr.length() <= 1)
    return arr;

  int pivot = arr[0];
  array<int> less;
  array<int> greater;

  for (uint i = 1; i < arr.length(); i++) {
    if (arr[i] <= pivot)
      less.insertLast(arr[i]);
    else
      greater.insertLast(arr[i]);
  }

  array<int> result;
  array<int> sl = quicksort(less);
  array<int> sg = quicksort(greater);
  for (uint i = 0; i < sl.length(); i++) result.insertLast(sl[i]);
  result.insertLast(pivot);
  for (uint i = 0; i < sg.length(); i++) result.insertLast(sg[i]);
  return result;
}

void main() {
  array<int> arr = {5, 2, 8, 1, 9, 3};
  array<int> result = quicksort(arr);
  for (uint i = 0; i < result.length(); i++)
    print(result[i]);
}