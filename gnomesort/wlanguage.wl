PROCEDURE GnomeSort(arr)
    LOCAL i = 0
    LOCAL temp

    WHILE i < ArrayCount(arr)
        IF i = 0 THEN
            i = i + 1
        ELSE
            IF arr[i] < arr[i - 1] THEN
                temp = arr[i]
                arr[i] = arr[i - 1]
                arr[i - 1] = temp
                i = i - 1
            ELSE
                i = i + 1
            END
        END
    END

    RETURN arr
END

PROCEDURE Main()
    LOCAL test = [5, 2, 8, 1, 9, 3]
    Trace(GnomeSort(test))
END
