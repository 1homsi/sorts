heapify←{
    arr n i←⍵
    largest←i
    left←(2×i)+1
    right←(2×i)+2
    largest←largest,(left<n)∧((left⊃arr)>(largest⊃arr)):left
    largest←largest,(right<n)∧((right⊃arr)>(largest⊃arr)):right
    largest≠i:∇((arr[i]←largest⊃arr)(arr[largest]←i⊃arr)) n largest
    arr
}

heapsort←{
    arr←⍵
    n←≢arr
    arr←⊃{heapify ⍵ n ⍺}/(⌊n÷2)-⍳⌊n÷2
    {i←⍵
     arr[1]arr[i]←arr[i]arr[1]
     arr←heapify arr i 0}¨⌽⍳n-1
    arr
}

⎕←heapsort 12 11 13 5 6 7
