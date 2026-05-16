function result = bitonic_sort_main()
    data = [3, 7, 4, 8, 6, 2, 1, 5];
    result = bitonic_sort(data, 1, length(data), true);
    disp(result);
end

function arr = compare_and_swap(arr, i, j, direction)
    if direction == (arr(i) > arr(j))
        tmp = arr(i);
        arr(i) = arr(j);
        arr(j) = tmp;
    end
end

function arr = bitonic_merge(arr, lo, cnt, direction)
    if cnt > 1
        k = floor(cnt / 2);
        for i = lo : lo + k - 1
            arr = compare_and_swap(arr, i, i + k, direction);
        end
        arr = bitonic_merge(arr, lo, k, direction);
        arr = bitonic_merge(arr, lo + k, k, direction);
    end
end

function arr = bitonic_sort(arr, lo, cnt, direction)
    if cnt > 1
        k = floor(cnt / 2);
        arr = bitonic_sort(arr, lo, k, true);
        arr = bitonic_sort(arr, lo + k, k, false);
        arr = bitonic_merge(arr, lo, cnt, direction);
    end
end
