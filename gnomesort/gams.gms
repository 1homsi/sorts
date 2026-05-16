$title Gnome Sort

Set i / 1*10 /;
Parameter data(i) / 1 5, 2 3, 3 8, 4 1, 5 9, 6 2, 7 7, 8 4, 9 6, 10 0 /;

Parameter arr(i);
arr(i) = data(i);

Scalar idx, tmp;
idx = 1;

Loop(dummy$(idx <= card(i)),
  If(idx eq 1,
    idx = idx + 1;
  ElseIf arr(idx) >= arr(idx-1),
    idx = idx + 1;
  Else
    tmp = arr(idx);
    arr(idx) = arr(idx-1);
    arr(idx-1) = tmp;
    idx = idx - 1;
  );
);

Display arr;
