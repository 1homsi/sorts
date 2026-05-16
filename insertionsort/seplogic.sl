{arr -> array(a0...an)}
insertion_sort(arr, n)
  i = 1;
  {arr -> array(sorted(a0..ai-1), a(i..n))}
  while i < n do
    key = arr[i];
    j = i - 1;
    while j >= 0 /\ arr[j] > key do
      {arr -> array(..., arr[j], arr[j+1], ...)}
      arr[j+1] = arr[j];
      j--;
      {arr -> array(..., arr[j+1], arr[j+1], ...)}
    done;
    arr[j+1] = key;
    i++;
  done
{arr -> array(sorted(a0..an))}
