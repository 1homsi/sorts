function arr = shellsort(arr)
    n = length(arr);
    gap = floor(n / 2);
    while gap > 0
        for i = gap + 1:n
            temp = arr(i);
            j = i;
            while j > gap && arr(j - gap) > temp
                arr(j) = arr(j - gap);
                j = j - gap;
            end
            arr(j) = temp;
        end
        gap = floor(gap / 2);
    end
end
