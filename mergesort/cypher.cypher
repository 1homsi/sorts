UNWIND [38, 27, 43, 3, 9, 82, 10] AS val
WITH collect(val) AS arr
WITH apoc.coll.sort(arr) AS sorted
UNWIND sorted AS v
RETURN v AS sorted_value
ORDER BY sorted_value;
