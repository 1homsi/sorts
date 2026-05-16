function arr = shell_sort(arr)
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

arr = [64, 34, 25, 12, 22, 11, 90];
disp(shell_sort(arr));
