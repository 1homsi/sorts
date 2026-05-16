⍝ Cocktail Shaker Sort in APL
CocktailSort←{
    A←⍵
    N←⍴A
    Start←1
    End←N
    Swapped←1
    :While Swapped
        Swapped←0
        :For I :In Start+⍳End-Start
            :If (I≤End-1)∧(A[I]>A[I+1])
                A[I I+1]←A[I+1 I]
                Swapped←1
            :EndIf
        :EndFor
        :If ~Swapped ⋄ :Leave ⋄ :EndIf
        Swapped←0
        End←End-1
        :For I :In ⌽Start+⍳End-Start-1
            :If A[I]>A[I+1]
                A[I I+1]←A[I+1 I]
                Swapped←1
            :EndIf
        :EndFor
        Start←Start+1
    :EndWhile
    A
}
