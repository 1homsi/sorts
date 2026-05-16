function arr = cycleSort(arr)
    n = length(arr);
    for cycleStart = 1:n-1
        item = arr(cycleStart);
        pos = cycleStart;
        for i = cycleStart+1:n
            if arr(i) < item
                pos = pos + 1;
            end
        end
        if pos == cycleStart
            continue;
        end
        while item == arr(pos)
            pos = pos + 1;
        end
        tmp = arr(pos);
        arr(pos) = item;
        item = tmp;
        while pos ~= cycleStart
            pos = cycleStart;
            for i = cycleStart+1:n
                if arr(i) < item
                    pos = pos + 1;
                end
            end
            while item == arr(pos)
                pos = pos + 1;
            end
            tmp = arr(pos);
            arr(pos) = item;
            item = tmp;
        end
    end
end

arr = [5 4 3 2 1];
arr = cycleSort(arr);
disp(arr)
