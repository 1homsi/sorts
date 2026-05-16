class RadixSort {
    def get_digit: x exp: exp {
        (x / exp) floor % 10
    }

    def counting_sort: arr exp: exp {
        result = []
        0 upto: 9 do: |d| {
            arr each: |x| {
                if: ((get_digit: x exp: exp) == d) then: {
                    result << x
                }
            }
        }
        result
    }

    def sort: arr {
        arr empty? if_true: { return arr }
        max_val = arr inject: 0 into: |acc x| { x > acc if_true: { x } if_false: { acc } }
        exp = 1
        result = arr
        { (max_val / exp) floor > 0 } while_true: {
            result = counting_sort: result exp: exp
            exp = exp * 10
        }
        result
    }
}

sorter = RadixSort new
sorter sort: [170, 45, 75, 90, 802, 24, 2, 66] . println
