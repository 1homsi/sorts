nodecount = 0
root = 0

insert: procedure expose nodecount val. left. right.
  parse arg idx, v
  if idx = 0 then do
    nodecount = nodecount + 1
    idx = nodecount
    val.idx = v
    left.idx = 0
    right.idx = 0
    return idx
  end
  if v < val.idx then
    left.idx = insert(left.idx, v)
  else
    right.idx = insert(right.idx, v)
  return idx

inorder: procedure expose val. left. right.
  parse arg idx
  if idx = 0 then return ''
  left_part = inorder(left.idx)
  right_part = inorder(right.idx)
  if left_part = '' then return val.idx right_part
  if right_part = '' then return left_part val.idx
  return left_part val.idx right_part

arr = '5 3 7 1 4 6 8'
do i = 1 to words(arr)
  root = insert(root, word(arr, i))
end
say inorder(root)
