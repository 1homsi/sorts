insert <- function(node, val) {
  if (is.null(node)) return(list(val=val, left=NULL, right=NULL))
  if (val < node$val) node$left <- insert(node$left, val)
  else node$right <- insert(node$right, val)
  node
}

inorder <- function(node) {
  if (is.null(node)) return(c())
  c(inorder(node$left), node$val, inorder(node$right))
}

treesort <- function(arr) {
  root <- NULL
  for (val in arr) root <- insert(root, val)
  inorder(root)
}

print(treesort(c(5, 3, 7, 1, 4, 6, 8)))
