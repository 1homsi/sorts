Object subclass: #BSTNode
    instanceVariableNames: 'val left right'
    classVariableNames: ''
    poolDictionaries: ''
    category: ''.

BSTNode class >> new: aVal [
    ^super new initVal: aVal
]

BSTNode >> initVal: aVal [
    val := aVal. left := nil. right := nil.
]

BSTNode >> insert: aVal [
    aVal < val
        ifTrue: [left isNil
            ifTrue: [left := BSTNode new: aVal]
            ifFalse: [left insert: aVal]]
        ifFalse: [right isNil
            ifTrue: [right := BSTNode new: aVal]
            ifFalse: [right insert: aVal]]
]

BSTNode >> inorder: aCollection [
    left isNil ifFalse: [left inorder: aCollection].
    aCollection add: val.
    right isNil ifFalse: [right inorder: aCollection].
]

| arr root result |
arr := #(5 3 7 1 4 6 8).
root := BSTNode new: arr first.
arr allButFirst do: [:v | root insert: v].
result := OrderedCollection new.
root inorder: result.
Transcript showCr: result printString.
