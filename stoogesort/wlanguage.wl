FUNCTION StoogeSort(LOCAL aArray, LOCAL i, LOCAL j)
  IF aArray[j] < aArray[i] THEN
    LET temp = aArray[j]
    aArray[j] = aArray[i]
    aArray[i] = temp
  END
  
  IF (j - i) > 1 THEN
    LET t = INT((j - i + 1) / 3)
    StoogeSort(aArray, i, j - t)
    StoogeSort(aArray, i + t, j)
    StoogeSort(aArray, i, j - t)
  END
RETURN aArray
