service GnomeSort {
    inputPort GnomeSortInput {
        location: "local"
        interfaces: GnomeSortInterface
    }

    main {
        gnomeSort(arr)(result) {
            n = #arr
            i = 0
            while(i < n) {
                if(i == 0 || arr[i] >= arr[i-1]) {
                    i++
                } else {
                    tmp = arr[i]
                    arr[i] = arr[i-1]
                    arr[i-1] = tmp
                    i--
                }
            }
            result << arr
        }
    }
}
