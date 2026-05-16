Quicksort := function(lst)
    local pivot, rest, left, right;
    if Length(lst) <= 1 then
        return lst;
    fi;
    pivot := lst[Int(Length(lst)/2) + 1];
    rest := Concatenation(lst{[1..Int(Length(lst)/2)]}, lst{[Int(Length(lst)/2)+2..Length(lst)]});
    left := Filtered(rest, x -> x <= pivot);
    right := Filtered(rest, x -> x > pivot);
    return Concatenation(Quicksort(left), [pivot], Quicksort(right));
end;

Print(Quicksort([3, 6, 8, 10, 1, 2, 1]), "\n");
