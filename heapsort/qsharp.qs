namespace Heapsort {
    operation Main() : Unit {
        let arr = [5, 2, 8, 1, 9, 3];
        let result = Heapsort(arr);
        Message($"{result}");
    }

    function Heapsort(arr : Int[]) : Int[] {
        mutable result = arr;
        let n = Length(arr);
        for i in RangeAsInt(Length(arr) / 2 - 1, -1, -1) {
            set result = SiftDown(result, i, n);
        }
        for i in RangeAsInt(n - 1, 0, -1) {
            let temp = result[0];
            set result w/= 0 <- result[i];
            set result w/= i <- temp;
            set result = SiftDown(result, 0, i);
        }
        return result;
    }

    function SiftDown(arr : Int[], i : Int, n : Int) : Int[] {
        mutable result = arr;
        mutable largest = i;
        let left = 2 * i + 1;
        let right = 2 * i + 2;
        if left < n && result[left] > result[largest] {
            set largest = left;
        }
        if right < n && result[right] > result[largest] {
            set largest = right;
        }
        if largest != i {
            let temp = result[i];
            set result w/= i <- result[largest];
            set result w/= largest <- temp;
            set result = SiftDown(result, largest, n);
        }
        return result;
    }
}
