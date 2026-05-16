function countingsort(arr) {
  local max = 0;
  foreach(val in arr) {
    if(val > max) {
      max = val;
    }
  }

  local count = array(max + 1, 0);
  foreach(val in arr) {
    count[val]++;
  }

  local output = [];
  for(local i = 0; i <= max; i++) {
    for(local j = 0; j < count[i]; j++) {
      output.push(i);
    }
  }

  return output;
}

print(countingsort([5, 2, 8, 1, 9, 3]));
