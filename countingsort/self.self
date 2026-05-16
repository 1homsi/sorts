| arr min max range count output n |
arr := (4, 2, 2, 8, 3, 3, 1) asOrderedCollection.
n := arr size.
min := arr inject: arr first into: [:m :v | v < m ifTrue: [v] ifFalse: [m]].
max := arr inject: arr first into: [:m :v | v > m ifTrue: [v] ifFalse: [m]].
range := max - min + 1.
count := OrderedCollection new: range withAll: 0.
arr do: [:v | count at: v - min + 1 put: (count at: v - min + 1) + 1].
2 to: range do: [:i | count at: i put: (count at: i) + (count at: i - 1)].
output := OrderedCollection new: n withAll: 0.
n to: 1 by: -1 do: [:i |
    | v pos |
    v := arr at: i.
    pos := count at: v - min + 1.
    count at: v - min + 1 put: pos - 1.
    output at: pos put: v].
output printNl.
