UNWIND [3,7,4,8,6,2,1,5] AS v
WITH collect(v) AS data
WITH apoc.coll.sort(data) AS sorted
RETURN sorted
