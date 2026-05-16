gnomesort:{[a]
    n:count a;
    i:0;
    while[i<n;
        $[i=0;[i+:1];
          a[i]>=a[i-1];[i+:1];
          [t:a i;a[i]:a[i-1];a[i-1]:t;i-:1]]
    ];
    a}
