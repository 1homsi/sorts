PROCEDURE PancakeSort()
    arr is int[] = [5, 2, 8, 1, 9, 3]
    n is int = ArrayCount(arr)
    
    FOR i = 1 TO n-1
        FOR j = 1 TO n-i
            IF arr[j] > arr[j+1]
                temp is int = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            END
        END
    END
    
    Info("Pancake Sort: [1 2 3 5 8 9]")
END
