object QuickSort
    operation sort[arr: Array[Integer], low: Integer, high: Integer]
        if low < high then
            const p = self.partition[arr, low, high]
            self.sort[arr, low, p - 1]
            self.sort[arr, p + 1, high]
        end if
    end sort

    operation partition[arr: Array[Integer], low: Integer, high: Integer] -> Integer
        const pivot = arr[high]
        var i: Integer := low
        var j: Integer := low
        loop
            exit when j >= high
            if arr[j] <= pivot then
                const tmp = arr[i]
                arr[i] := arr[j]
                arr[j] := tmp
                i := i + 1
            end if
            j := j + 1
        end loop
        const tmp = arr[i]
        arr[i] := arr[high]
        arr[high] := tmp
        return i
    end partition
end QuickSort

const sorter = QuickSort
const arr = Array[Integer].create[7]
arr[0] := 3; arr[1] := 6; arr[2] := 8; arr[3] := 10
arr[4] := 1; arr[5] := 2; arr[6] := 1
sorter.sort[arr, 0, 6]
