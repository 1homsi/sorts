def stoogesort(a, i=0, j=None):
    if j is None:
        j = len(a) - 1
    if a[j] < a[i]:
        a[i], a[j] = a[j], a[i]
    if j - i > 1:
        t = (j - i + 1) // 3
        stoogesort(a, i, j - t)
        stoogesort(a, i + t, j)
        stoogesort(a, i, j - t)
