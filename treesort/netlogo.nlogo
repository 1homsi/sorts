breed [nodes node]

to setup
  clear-all
  let arr [5 2 8 1 9 3]
  let root nobody
  foreach arr [ val ->
    set root insert root val
  ]
  inorder root
  stop
end

to-report insert [node val]
  if node = nobody [
    let n create-temporary-plot-pen
    ask n [set value val]
    report n
  ]
  if val < [value] of node [
    ask node [set left insert left val]
  ]
  if val > [value] of node [
    ask node [set right insert right val]
  ]
  report node
end

to inorder [node]
  if node != nobody [
    inorder [left] of node
    print [value] of node
    inorder [right] of node
  ]
end
