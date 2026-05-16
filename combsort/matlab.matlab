function arr = comb_sort(arr)
    n = length(arr);
    gap = n;
    shrink = 1.3;
    sorted = false;
    while ~sorted
        gap = floor(gap / shrink);
        if gap < 1
            gap = 1;
        end
        if gap == 1
            sorted = true;
        end
        for i = 1:n-gap
            if arr(i) > arr(i + gap)
                tmp = arr(i);
                arr(i) = arr(i + gap);
                arr(i + gap) = tmp;
                sorted = false;
            end
        end
    end
end
