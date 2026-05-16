class GNOME_SORT

feature
    sort (arr: ARRAY [INTEGER])
        local
            i, n, tmp: INTEGER
        do
            n := arr.count
            i := 1
            from until i > n loop
                if i = 1 or else arr.item (i) >= arr.item (i - 1) then
                    i := i + 1
                else
                    tmp := arr.item (i)
                    arr.put (arr.item (i - 1), i)
                    arr.put (tmp, i - 1)
                    i := i - 1
                end
            end
        end

end
