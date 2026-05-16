export fn quicksort(arr: []int) []int = {
  if (len(arr) <= 1) return arr;

  let pivot = arr[0];
  let less: []int = [];
  let greater: []int = [];

  for (let i = 1z; i < len(arr); i += 1) {
    if (arr[i] <= pivot) {
      append(less, arr[i]);
    } else {
      append(greater, arr[i]);
    };
  };

  let result = append(quicksort(less), pivot);
  return append(result, quicksort(greater)...);
};

export fn main() void = {
  let arr: [6]int = [5, 2, 8, 1, 9, 3];
  fmt::println("{}", quicksort(arr[:]));
};