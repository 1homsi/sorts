fun insert(x :: Number, lst :: List<Number>) -> List<Number>:
  cases (List) lst:
    | empty => [list: x]
    | link(h, t) =>
      if x <= h: link(x, lst)
      else: link(h, insert(x, t))
      end
  end
end

fun insertion-sort(lst :: List<Number>) -> List<Number>:
  cases (List) lst:
    | empty => empty
    | link(h, t) => insert(h, insertion-sort(t))
  end
end
