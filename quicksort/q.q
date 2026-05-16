qs:{$[1>count x;x;raze(qs x where x<p;x where x=p;qs x where x>p:x count[x]div 2]}
qs 3 6 8 10 1 2 1
