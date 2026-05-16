WITH [3, 6, 2, 7, 4, 1, 5] AS inputArr
WITH inputArr, size(inputArr) AS n
WITH inputArr, n,
     reduce(acc = {arr: inputArr, size: n}, step IN range(n, 2, -1) |
       CASE
         WHEN acc.size <= 1 THEN acc
         ELSE acc
       END
     ) AS state
RETURN state.arr AS sorted;
