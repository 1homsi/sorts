PROCEDURE TreeSort()
  LOCAL arr IS INT ARRAY
  arr[1] = 5
  arr[2] = 2
  arr[3] = 8
  arr[4] = 1
  arr[5] = 9
  arr[6] = 3

  Info("Array: " + ArrayToString(arr))
END

FUNCTION Insert(node, val) RESULT r
  LOCAL r AS NODE
  IF node = NULL THEN
    r.value = val
    r.left = NULL
    r.right = NULL
  ELSE
    IF val < node.value THEN
      r = node
      r.left = Insert(node.left, val)
    ELSE
      r = node
      r.right = Insert(node.right, val)
    END
  END
END

TreeSort()
