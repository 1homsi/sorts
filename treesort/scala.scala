sealed trait Tree
case object Leaf extends Tree
case class Branch(left: Tree, v: Int, right: Tree) extends Tree

def insert(tree: Tree, v: Int): Tree = tree match {
  case Leaf => Branch(Leaf, v, Leaf)
  case Branch(l, x, r) =>
    if (v < x) Branch(insert(l, v), x, r)
    else Branch(l, x, insert(r, v))
}

def inorder(tree: Tree): List[Int] = tree match {
  case Leaf => Nil
  case Branch(l, v, r) => inorder(l) ++ List(v) ++ inorder(r)
}

def treesort(arr: List[Int]): List[Int] = {
  val tree = arr.foldLeft[Tree](Leaf)(insert)
  inorder(tree)
}

@main def run() = println(treesort(List(5, 3, 7, 1, 4, 6, 8)))
