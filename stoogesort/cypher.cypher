CREATE (a0:Val {idx: 0, val: 3})
CREATE (a1:Val {idx: 1, val: 1})
CREATE (a2:Val {idx: 2, val: 4})
CREATE (a3:Val {idx: 3, val: 1})
CREATE (a4:Val {idx: 4, val: 5})
CREATE (a5:Val {idx: 5, val: 9})
CREATE (a6:Val {idx: 6, val: 2})
CREATE (a7:Val {idx: 7, val: 6});

MATCH (v:Val)
RETURN v.val ORDER BY v.val;
