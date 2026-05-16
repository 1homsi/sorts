def is_sorted: arr {
    arr each_with_index: |x i| {
        i < (arr size - 1) if_true: {
            x > (arr at: i + 1) if_true: { return: false }
        }
    }
    true
}

def shuffle: arr {
    n = arr size
    (n - 1) downto: 1 do: |i| {
        j = (Float random * (i + 1)) to_i
        tmp = arr at: i
        arr at: i put: (arr at: j)
        arr at: j put: tmp
    }
    arr
}

def bogosort: arr {
    { is_sorted(arr) not } while_true: {
        shuffle(arr)
    }
    arr
}

arr = [3, 1, 4, 1, 5, 9, 2, 6]
bogosort(arr) println
