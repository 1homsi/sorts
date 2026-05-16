gnomesort:{[a]
    n:#a
    i:0
    while[i<n;
        if[i=0;i+:1;
        if[a[i]>=a[i-1];i+:1;
        [t:a[i];a[i]:a[i-1];a[i-1]:t;i-:1]]]
    ];a}
