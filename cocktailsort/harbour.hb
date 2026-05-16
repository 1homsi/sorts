FUNCTION CocktailSort( arr, n )
   LOCAL swapped := .T.
   LOCAL start := 1
   LOCAL ending := n
   LOCAL i, tmp
   DO WHILE swapped
      swapped := .F.
      FOR i := start TO ending - 1
         IF arr[ i ] > arr[ i + 1 ]
            tmp := arr[ i ]
            arr[ i ] := arr[ i + 1 ]
            arr[ i + 1 ] := tmp
            swapped := .T.
         ENDIF
      NEXT
      IF ! swapped
         RETURN arr
      ENDIF
      swapped := .F.
      ending--
      FOR i := ending - 1 TO start STEP -1
         IF arr[ i ] > arr[ i + 1 ]
            tmp := arr[ i ]
            arr[ i ] := arr[ i + 1 ]
            arr[ i + 1 ] := tmp
            swapped := .T.
         ENDIF
      NEXT
      start++
   ENDDO
   RETURN arr
