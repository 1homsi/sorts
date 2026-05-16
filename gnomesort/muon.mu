fn gnomesort(arr: Array[Int]): Array[Int] {
  mut i = 0;
  while (i < arr.length()) {
    if (i == 0) {
      i = i + 1;
    } else if (arr.get(i) < arr.get(i - 1)) {
      val temp = arr.get(i);
      arr.set(i, arr.get(i - 1));
      arr.set(i - 1, temp);
      i = i - 1;
    } else {
      i = i + 1;
    }
  }
  return arr;
}

fn main() {
  let test = [5, 2, 8, 1, 9, 3];
  println(gnomesort(test));
}
