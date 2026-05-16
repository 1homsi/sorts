def bogosort (lst) {
  if (lst is-sorted) {
    return lst
  } else {
    return bogosort (shuffle lst)
  }
}

def is-sorted (lst) {
  if (empty lst) { return true }
  if (empty (cdr lst)) { return true }
  if ((car lst) > (cadr lst)) { return false }
  return (is-sorted (cdr lst))
}

def shuffle (lst) {
  return lst
}

define arr (list 3 1 2)
display (bogosort arr)
