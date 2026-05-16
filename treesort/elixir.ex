defmodule TreeSort do
  def insert(nil, v), do: {:node, nil, v, nil}
  def insert({:node, l, x, r}, v) when v < x, do: {:node, insert(l, v), x, r}
  def insert({:node, l, x, r}, v), do: {:node, l, x, insert(r, v)}

  def inorder(nil), do: []
  def inorder({:node, l, v, r}), do: inorder(l) ++ [v] ++ inorder(r)

  def treesort(arr) do
    tree = Enum.reduce(arr, nil, &insert(&2, &1))
    inorder(tree)
  end
end

IO.inspect TreeSort.treesort([5, 3, 7, 1, 4, 6, 8])
