(
var arr = [5, 2, 8, 1, 9, 3];
var n = arr.size;
var i = 0;
var j = 0;
var temp = 0;

while(i < (n - 1), {
    j = 0;
    while(j < (n - i - 1), {
        if(arr[j] > arr[j + 1], {
            temp = arr[j];
            arr[j] = arr[j + 1];
            arr[j + 1] = temp;
        });
        j = j + 1;
    });
    i = i + 1;
});

"Pancake Sort: ".post;
arr.postln;
)
