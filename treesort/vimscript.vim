function! s:insert(node, val)
  if empty(a:node)
    return {'value': a:val, 'left': {}, 'right': {}}
  endif
  if a:val < a:node.value
    let a:node.left = s:insert(a:node.left, a:val)
  elseif a:val > a:node.value
    let a:node.right = s:insert(a:node.right, a:val)
  endif
  return a:node
endfunction

function! s:inorder(node, result)
  if empty(a:node)
    return a:result
  endif
  let a:result = s:inorder(a:node.left, a:result)
  call add(a:result, a:node.value)
  return s:inorder(a:node.right, a:result)
endfunction

function! TreeSort(arr)
  let root = {}
  for val in a:arr
    let root = s:insert(root, val)
  endfor
  return s:inorder(root, [])
endfunction

echo TreeSort([5, 2, 8, 1, 9, 3])
