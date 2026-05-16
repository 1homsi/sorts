def heapify: arr size: n at: i {
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    { left < n && (arr[left] > arr[largest]) } if: { largest = left }
    { right < n && (arr[right] > arr[largest]) } if: { largest = right }
    { largest != i } if: {
        tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify: arr size: n at: largest
    }
}

def heapsort: arr {
    n = arr size
    i = n / 2 - 1
    { i >= 0 } while_true: {
        heapify: arr size: n at: i
        i = i - 1
    }
    i = n - 1
    { i > 0 } while_true: {
        tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify: arr size: i at: 0
        i = i - 1
    }
    arr
}

arr = [12, 11, 13, 5, 6, 7]
heapsort: arr . println
