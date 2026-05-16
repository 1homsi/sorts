class BUCKET_SORT

create make

feature

    make
        local
            data: ARRAY[REAL_64]
            sorted: ARRAY[REAL_64]
        do
            create data.make_filled(0.0, 1, 10)
            data[1] := 0.78; data[2] := 0.17; data[3] := 0.39
            data[4] := 0.26; data[5] := 0.72; data[6] := 0.94
            data[7] := 0.21; data[8] := 0.12; data[9] := 0.23
            data[10] := 0.68
            sorted := bucket_sort(data)
            across sorted as v loop print(v.item.out + " ") end
            print("%N")
        end

    insertion_sort(bucket: ARRAY[REAL_64]; n: INTEGER)
        local
            key: REAL_64
            i, j: INTEGER
        do
            from i := bucket.lower + 1 until i > bucket.lower + n - 1 loop
                key := bucket[i]
                j := i - 1
                from until j < bucket.lower or else bucket[j] <= key loop
                    bucket[j + 1] := bucket[j]
                    j := j - 1
                end
                bucket[j + 1] := key
                i := i + 1
            end
        end

    bucket_sort(arr: ARRAY[REAL_64]): ARRAY[REAL_64]
        local
            n, idx, pos, b, i: INTEGER
            min_v, max_v, num: REAL_64
            buckets: ARRAY[ARRAY[REAL_64]]
            counts: ARRAY[INTEGER]
        do
            n := arr.count
            if n = 0 then Result := arr else
                min_v := arr[arr.lower]; max_v := arr[arr.lower]
                across arr as v loop
                    if v.item < min_v then min_v := v.item end
                    if v.item > max_v then max_v := v.item end
                end
                create buckets.make_filled(create {ARRAY[REAL_64]}.make_filled(0.0, 1, n), 1, n)
                from i := 1 until i > n loop
                    create buckets[i].make_filled(0.0, 1, n)
                    i := i + 1
                end
                create counts.make_filled(0, 1, n)
                across arr as v loop
                    num := v.item
                    idx := ((num - min_v) / (max_v - min_v + 1) * n).truncated + 1
                    if idx > n then idx := n end
                    counts[idx] := counts[idx] + 1
                    buckets[idx][counts[idx]] := num
                end
                create Result.make_filled(0.0, 1, n)
                pos := 1
                from b := 1 until b > n loop
                    insertion_sort(buckets[b], counts[b])
                    from i := 1 until i > counts[b] loop
                        Result[pos] := buckets[b][i]
                        pos := pos + 1
                        i := i + 1
                    end
                    b := b + 1
                end
            end
        end

end
