def cocktail_sort: arr {
    swapped = true
    start = 0
    end = arr size - 1
    { swapped } while_true: {
        swapped = false
        start upto: end - 1 do: |i| {
            { arr[i] > arr[i + 1] } if: {
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            }
        }
        swapped not if: { ^ arr }
        swapped = false
        end = end - 1
        i = end - 1
        { i >= start } while_true: {
            { arr[i] > arr[i + 1] } if: {
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            }
            i = i - 1
        }
        start = start + 1
    }
    arr
}
