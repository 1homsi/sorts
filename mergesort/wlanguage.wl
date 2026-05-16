PROCEDURE Merge(ARR, LEFT, MID, RIGHT)
  I = LEFT
  J = MID + 1
  RESULT = {}
  K = 1
  
  WHILE I <= MID AND J <= RIGHT
    IF ARR[I] <= ARR[J]
      RESULT[K] = ARR[I]
      I = I + 1
    ELSE
      RESULT[K] = ARR[J]
      J = J + 1
    END
    K = K + 1
  END
  
  WHILE I <= MID
    RESULT[K] = ARR[I]
    I = I + 1
    K = K + 1
  END
  
  WHILE J <= RIGHT
    RESULT[K] = ARR[J]
    J = J + 1
    K = K + 1
  END
END

PROCEDURE MergeSort(ARR, LEFT, RIGHT)
  IF LEFT < RIGHT THEN
    MID = (LEFT + RIGHT) / 2
    MergeSort(ARR, LEFT, MID)
    MergeSort(ARR, MID + 1, RIGHT)
    Merge(ARR, LEFT, MID, RIGHT)
  END
END

PROCEDURE Main()
  ARR = [5, 2, 8, 1, 9, 3]
  MergeSort(ARR, 1, 6)
  PRINT ARR
END
