MATCH (n:Number)
WITH collect(n.value) AS arr
WITH arr, size(arr) AS sz
UNWIND range(0, sz - 1) AS i
WITH arr, i, sz
ORDER BY i
RETURN arr[i] AS sorted_value
ORDER BY sorted_value;
