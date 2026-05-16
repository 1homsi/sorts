cycleSort←{
    a←⍵
    n←≢a
    writes←0
    :For cycleStart :In ⍳n-1
        item←a[cycleStart]
        pos←cycleStart
        :For i :In (cycleStart+1)↓⍳n
            :If a[i]<item
                pos←pos+1
            :EndIf
        :EndFor
        :If pos≠cycleStart
            :While item=a[pos] ⋄ pos←pos+1 ⋄ :EndWhile
            tmp←a[pos] ⋄ a[pos]←item ⋄ item←tmp
            writes←writes+1
            :While pos≠cycleStart
                pos←cycleStart
                :For i :In (cycleStart+1)↓⍳n
                    :If a[i]<item ⋄ pos←pos+1 ⋄ :EndIf
                :EndFor
                :While item=a[pos] ⋄ pos←pos+1 ⋄ :EndWhile
                tmp←a[pos] ⋄ a[pos]←item ⋄ item←tmp
                writes←writes+1
            :EndWhile
        :EndIf
    :EndFor
    a
}

⎕←cycleSort 5 4 3 2 1
