FUNCTION CocktailSort( aArr, nLen )
   LOCAL lSwapped := .T.
   LOCAL nStart := 1
   LOCAL nEnd := nLen
   LOCAL nI, xTmp
   DO WHILE lSwapped
      lSwapped := .F.
      FOR nI := nStart TO nEnd - 1
         IF aArr[ nI ] > aArr[ nI + 1 ]
            xTmp := aArr[ nI ]
            aArr[ nI ] := aArr[ nI + 1 ]
            aArr[ nI + 1 ] := xTmp
            lSwapped := .T.
         ENDIF
      NEXT
      IF ! lSwapped
         RETURN aArr
      ENDIF
      lSwapped := .F.
      nEnd--
      FOR nI := nEnd - 1 TO nStart STEP -1
         IF aArr[ nI ] > aArr[ nI + 1 ]
            xTmp := aArr[ nI ]
            aArr[ nI ] := aArr[ nI + 1 ]
            aArr[ nI + 1 ] := xTmp
            lSwapped := .T.
         ENDIF
      NEXT
      nStart++
   ENDDO
   RETURN aArr
