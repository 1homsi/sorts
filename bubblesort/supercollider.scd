(\bubblesort -> { |arr|
  var n = arr.size;
  var i, j, temp;
  for(i = 0; i < n; i = i + 1; {
    for(j = 0; j < (n - 1 - i); j = j + 1; {
      if(arr[j] > arr[j + 1]; {
        temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      });
    });
  });
  arr;
}).value([5, 2, 8, 1, 9, 3]).postln;