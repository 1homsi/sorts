WITH [64, 34, 25, 12, 22, 11, 90] AS input
WITH apoc.coll.sort(input) AS sorted
RETURN sorted
