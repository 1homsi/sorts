⍝ Pancake Sort in APL
flip ← {⊖⍵}

pancakeSort ← {
    arr ← ⍵
    n ← ≢arr
    size ← n
    :While size > 1
        sub ← size↑arr
        maxIdx ← (sub⍳⌈/sub)
        :If maxIdx ≠ size
            :If maxIdx ≠ 1
                arr ← (⌽maxIdx↑arr),(maxIdx↓arr)
            :EndIf
            arr ← (⌽size↑arr),(size↓arr)
        :EndIf
        size ← size - 1
    :EndWhile
    arr
}

⎕ ← pancakeSort 3 6 2 7 4 1 5
