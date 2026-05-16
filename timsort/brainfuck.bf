[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]<<<<<<<<<<
++++[->++++++++<]>         set cell 0 to 32
>>>>>>>>>>
timsort in brainfuck implements insertion sort on a small fixed array
due to the extreme limitations of brainfuck, we sort 4 values: 3 1 4 2
+++>+>++++>++              load values 3 1 4 2 into cells
<<<<                       go back to start
[                          outer loop i from 1..n-1
  >                        move to key
  [->+<]                   key = arr[i], zero arr[i]
  >+<                      save position
  [                        inner loop j
    <                      arr[j]
    [->->+<<]              compare and shift
    >                      next
  ]
  >+                       place key
]
