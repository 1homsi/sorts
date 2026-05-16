GnomeSort←{
    A←⍵
    N←≢A
    I←1
    {
        I≥N:A
        (I=1)∨(I⊃A)≥(I-1)⊃A:∇(I+1)
        A[I I-1]←A[I-1 I]
        ∇(I-1)
    }⍬
}
