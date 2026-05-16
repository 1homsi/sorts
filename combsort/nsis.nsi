!define ARR_SIZE 6

Var gap
Var swapped
Var i
Var temp
Var arr[${ARR_SIZE}]

Function CombSort
  StrCpy $gap ${ARR_SIZE}
  StrCpy $swapped 1

  loop:
    ${If} $gap <= 1
      ${If} $swapped == 0
        Return
      ${EndIf}
    ${EndIf}

    IntOp $gap $gap * 10
    IntOp $gap $gap / 13

    ${If} $gap < 1
      StrCpy $gap 1
    ${EndIf}

    StrCpy $swapped 0
    StrCpy $i 0

    innerloop:
      ${If} $i >= ${ARR_SIZE}
        ${If} $gap > 1
          Goto loop
        ${EndIf}
        Return
      ${EndIf}

      ${If} $arr[$i] > $arr[$i + $gap]
        StrCpy $temp $arr[$i]
        StrCpy $arr[$i] $arr[$i + $gap]
        StrCpy $arr[$i + $gap] $temp
        StrCpy $swapped 1
      ${EndIf}

      IntOp $i $i + 1
      Goto innerloop
FunctionEnd
