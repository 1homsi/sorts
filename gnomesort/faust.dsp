import("stdfaust.lib");

gnomesort(arr) = go(0, arr)
with {
  go(i, a) = ba.if(i >= 6, a,
    ba.if(i == 0,
      go(i+1, a),
      ba.if(a[i] < a[i-1],
        go(i-1, swap(i, i-1, a)),
        go(i+1, a)
      )
    )
  );

  swap(i, j, a) = par(k, 6,
    ba.if(k == i, a[j],
      ba.if(k == j, a[i], a[k])
    )
  );
};

process = 5, 2, 8, 1, 9, 3 : gnomesort;
