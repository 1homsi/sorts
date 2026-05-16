package selectionsort

#SelectionSort: {
    input: [...int]
    output: [for i, _ in input {input[i]}] & list.Sort(input, list.Ascending)
}
