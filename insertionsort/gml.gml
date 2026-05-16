var arr = [5, 3, 1, 4, 2];
var n = array_length(arr);

for (var i = 1; i < n; i++) {
    var key = arr[i];
    var j = i - 1;
    while (j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j--;
    }
    arr[j + 1] = key;
}

var result = "";
for (var k = 0; k < n; k++) {
    result += string(arr[k]);
    if (k < n - 1) result += ", ";
}
show_message(result);
