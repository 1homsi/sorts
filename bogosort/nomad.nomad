DEFINE is_sorted(arr ARRAY) RETURNS BOOLEAN
  FOREACH i FROM 1 TO COUNT(arr) - 1
    IF arr[i] > arr[i + 1]
      RETURN FALSE
    ENDIF
  ENDFOREACH
  RETURN TRUE
ENDDEFINE

DEFINE shuffle(arr ARRAY) RETURNS ARRAY
  n = COUNT(arr)
  FOR i = n DOWNTO 2
    j = RANDOM(1, i)
    tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
  ENDFOR
  RETURN arr
ENDDEFINE

DEFINE bogosort(arr ARRAY) RETURNS ARRAY
  WHILE NOT is_sorted(arr)
    arr = shuffle(arr)
  ENDWHILE
  RETURN arr
ENDDEFINE

arr = {3, 1, 4, 1, 5, 9, 2, 6}
PRINT bogosort(arr)
