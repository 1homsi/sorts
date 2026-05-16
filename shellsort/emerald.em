const ShellSort == object shellSort
    export operation sort[arr: Array.of[Integer], n: Integer]
        var gap : Integer := n / 2
        var temp : Integer
        var i, j : Integer
        loop
            exit when gap <= 0
            i := gap
            loop
                exit when i >= n
                temp := arr.getElement[i]
                j := i
                loop
                    exit when j < gap || arr.getElement[j - gap] <= temp
                    arr.setElement[j, arr.getElement[j - gap]]
                    j := j - gap
                end loop
                arr.setElement[j, temp]
                i := i + 1
            end loop
            gap := gap / 2
        end loop
    end operation
end shellSort
