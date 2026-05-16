RadixSort←{
    arr←⍵
    0=≢arr:arr
    max←⌈/arr
    exp←1
    {
        max⌊exp≡0:arr
        digit←{10|⌊⍵÷exp}
        buckets←{⍵[⍋digit ⍵]}arr
        arr←buckets
        exp×←10
        ∇ arr
    }arr
}

⎕←RadixSort 170 45 75 90 802 24 2 66
