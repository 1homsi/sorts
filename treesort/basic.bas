DIM val(100), lft(100), rgt(100)
DIM nodeCount AS INTEGER
nodeCount = 0

SUB insert(idx AS INTEGER, v AS INTEGER)
  IF idx = 0 THEN
    nodeCount = nodeCount + 1
    idx = nodeCount
    val(idx) = v
    lft(idx) = 0
    rgt(idx) = 0
  ELSEIF v < val(idx) THEN
    insert lft(idx), v
  ELSE
    insert rgt(idx), v
  END IF
END SUB

SUB inorder(idx AS INTEGER)
  IF idx = 0 THEN EXIT SUB
  inorder lft(idx)
  PRINT val(idx); " ";
  inorder rgt(idx)
END SUB

DIM arr(6) AS INTEGER
arr(0)=5: arr(1)=3: arr(2)=7: arr(3)=1: arr(4)=4: arr(5)=6: arr(6)=8
DIM root AS INTEGER
root = 0
DIM i AS INTEGER
FOR i = 0 TO 6
  insert root, arr(i)
NEXT i
inorder root
PRINT
