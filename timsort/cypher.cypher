UNWIND [5, 2, 8, 1, 9, 3, 7, 4, 6] AS val
CREATE (n:SortItem {value: val})
RETURN n;

MATCH (n:SortItem)
WITH collect(n.value) AS vals
WITH [v IN vals | v] AS arr
RETURN apoc.coll.sort(arr) AS sorted;

MATCH (n:SortItem)
RETURN n.value
ORDER BY n.value;

WITH [5, 2, 8, 1, 9, 3, 7, 4, 6] AS input
UNWIND range(0, size(input)-1) AS i
WITH i, input[i] AS val,
     [x IN input WHERE x <= input[i] | x] AS smaller
RETURN val, size(smaller) AS rank
ORDER BY rank;
