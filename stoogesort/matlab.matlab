function stooge_sort_main()
    arr = [3, 1, 4, 1, 5, 9, 2, 6];
    arr = stooge_sort(arr, 1, length(arr));
    disp(arr);
end

function arr = stooge_sort(arr, first, last)
    if arr(first) > arr(last)
        tmp = arr(first);
        arr(first) = arr(last);
        arr(last) = tmp;
    end
    if last - first + 1 > 2
        t = floor((last - first + 1) * 2 / 3);
        arr = stooge_sort(arr, first, first + t - 1);
        arr = stooge_sort(arr, last - t + 1, last);
        arr = stooge_sort(arr, first, first + t - 1);
    end
end
