FORM insertion_sort CHANGING arr TYPE i_t_int.
  DATA: n TYPE i,
        i TYPE i,
        j TYPE i,
        key TYPE i.
  n = lines( arr ).
  DO n - 1 TIMES.
    i = sy-index + 1.
    key = arr[ i ].
    j = i - 1.
    WHILE j >= 1 AND arr[ j ] > key.
      arr[ j + 1 ] = arr[ j ].
      j = j - 1.
    ENDWHILE.
    arr[ j + 1 ] = key.
  ENDDO.
ENDFORM.
