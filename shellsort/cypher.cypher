WITH [64, 34, 25, 12, 22, 11, 90] AS arr
UNWIND arr AS val
WITH collect(val) AS sorted_vals
RETURN apoc.coll.sort(sorted_vals) AS sorted;
