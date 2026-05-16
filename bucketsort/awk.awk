BEGIN {
    n = 10
    arr[1]=78; arr[2]=17; arr[3]=39; arr[4]=26; arr[5]=72
    arr[6]=94; arr[7]=21; arr[8]=12; arr[9]=23; arr[10]=68

    minV = arr[1]; maxV = arr[1]
    for (i = 1; i <= n; i++) {
        if (arr[i] < minV) minV = arr[i]
        if (arr[i] > maxV) maxV = arr[i]
    }

    for (i = 1; i <= n; i++) {
        for (j = 1; j <= n; j++) count[j] = 0
    }
    for (k in count) count[k] = 0

    for (i = 1; i <= n; i++) {
        idx = int((arr[i] - minV) / (maxV - minV + 1) * n) + 1
        if (idx > n) idx = n
        count[idx]++
        bucket[idx, count[idx]] = arr[i]
    }

    pos = 1
    for (b = 1; b <= n; b++) {
        m = count[b]
        for (i = 2; i <= m; i++) {
            key = bucket[b, i]
            j = i - 1
            while (j >= 1 && bucket[b, j] > key) {
                bucket[b, j+1] = bucket[b, j]
                j--
            }
            bucket[b, j+1] = key
        }
        for (i = 1; i <= m; i++) {
            arr[pos++] = bucket[b, i]
        }
    }

    for (i = 1; i <= n; i++) printf "%d ", arr[i]
    print ""
}
