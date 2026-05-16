int[] quicksort(int[] arr) {
  if (arr.length <= 1)
    return arr;

  int pivot = arr[0];
  ArrayList<Integer> less = new ArrayList<Integer>();
  ArrayList<Integer> greater = new ArrayList<Integer>();

  for (int i = 1; i < arr.length; i++) {
    if (arr[i] <= pivot)
      less.add(arr[i]);
    else
      greater.add(arr[i]);
  }

  int[] lArr = new int[less.size()];
  int[] gArr = new int[greater.size()];
  for (int i = 0; i < less.size(); i++) lArr[i] = less.get(i);
  for (int i = 0; i < greater.size(); i++) gArr[i] = greater.get(i);

  int[] lessSort = quicksort(lArr);
  int[] greaterSort = quicksort(gArr);
  int[] result = new int[arr.length];
  int idx = 0;
  for (int x : lessSort) result[idx++] = x;
  result[idx++] = pivot;
  for (int x : greaterSort) result[idx++] = x;
  return result;
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  println(quicksort(arr));
}