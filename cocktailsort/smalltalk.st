Object subclass: #CocktailSort
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Sorting'.

CocktailSort class >> sort: anArray [
    | swapped start end temp |
    swapped := true.
    start := 1.
    end := anArray size.
    [swapped] whileTrue: [
        swapped := false.
        start to: end - 1 do: [:i |
            (anArray at: i) > (anArray at: i + 1) ifTrue: [
                temp := anArray at: i.
                anArray at: i put: (anArray at: i + 1).
                anArray at: i + 1 put: temp.
                swapped := true.
            ].
        ].
        swapped ifFalse: [^anArray].
        swapped := false.
        end := end - 1.
        end - 1 to: start by: -1 do: [:i |
            (anArray at: i) > (anArray at: i + 1) ifTrue: [
                temp := anArray at: i.
                anArray at: i put: (anArray at: i + 1).
                anArray at: i + 1 put: temp.
                swapped := true.
            ].
        ].
        start := start + 1.
    ].
    ^anArray
]
