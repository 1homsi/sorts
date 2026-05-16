BubbleSort←{
    a←⍵
    n←≢a
    {
        swapped←0
        :For i :In ⍳n-1
            :If (i⊃a)>(i+1)⊃a
                tmp←i⊃a
                a[i]←(i+1)⊃a
                a[i+1]←tmp
                swapped←1
            :EndIf
        :EndFor
        n-←1
        swapped:∇a
        a
    }a
}

⎕←BubbleSort 64 34 25 12 22 11 90
