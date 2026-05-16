/* REXX */
arr.1 = 78; arr.2 = 17; arr.3 = 39; arr.4 = 26; arr.5 = 72
arr.6 = 94; arr.7 = 21; arr.8 = 12; arr.9 = 23; arr.10 = 68
n = 10

minv = arr.1; maxv = arr.1
do i = 1 to n
  if arr.i < minv then minv = arr.i
  if arr.i > maxv then maxv = arr.i
end

do i = 1 to n
  bcnt.i = 0
end

range = maxv - minv + 1
do i = 1 to n
  num = arr.i
  idx = trunc((num - minv) * n / range) + 1
  if idx > n then idx = n
  bcnt.idx = bcnt.idx + 1
  k = idx || '.' || bcnt.idx
  bkt.k = num
end

pos = 1
do b = 1 to n
  m = bcnt.b
  do i = 2 to m
    k = b || '.' || i
    key = bkt.k
    j = i - 1
    do while j >= 1
      k2 = b || '.' || j
      if bkt.k2 <= key then leave
      k3 = b || '.' || (j+1)
      bkt.k3 = bkt.k2
      j = j - 1
    end
    k4 = b || '.' || (j+1)
    bkt.k4 = key
  end
  do i = 1 to m
    k = b || '.' || i
    arr.pos = bkt.k
    pos = pos + 1
  end
end

do i = 1 to n
  say arr.i
end
