Minimize
  obj: 0

Subject To
  order1: sorted1 - sorted2 <= 0
  order2: sorted2 - sorted3 <= 0
  order3: sorted3 - sorted4 <= 0
  order4: sorted4 - sorted5 <= 0
  order5: sorted5 - sorted6 <= 0
  order6: sorted6 - sorted7 <= 0

Bounds
  0 <= sorted1 <= 100
  0 <= sorted2 <= 100
  0 <= sorted3 <= 100
  0 <= sorted4 <= 100
  0 <= sorted5 <= 100
  0 <= sorted6 <= 100
  0 <= sorted7 <= 100

End
