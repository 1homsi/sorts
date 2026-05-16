CombSort←{
    arr←⍵
    n←≢arr
    gap←n
    sorted←0
    :Repeat
        gap←⌊gap÷1.3
        gap←1⌈gap
        :If gap=1 ⋄ sorted←1 ⋄ :EndIf
        changed←0
        :For i :In ⍳n-gap
            :If (i⊃arr)>(i+gap)⊃arr
                arr[i i+gap]←arr[i+gap i]
                sorted←0
                changed←1
            :EndIf
        :EndFor
    :Until sorted∧~changed
    arr
}
