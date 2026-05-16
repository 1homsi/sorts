object bogosort

  var arr := Vector.new(8)
  var n := 8

  initially
    arr.addLast(3) arr.addLast(1) arr.addLast(4) arr.addLast(1)
    arr.addLast(5) arr.addLast(9) arr.addLast(2) arr.addLast(6)
  end initially

  operation isSorted -> Boolean
    for i : Integer := 0 while i < n - 1 by i := i + 1 do
      if arr.getElement(i) > arr.getElement(i + 1) then
        return false
      end if
    end for
    return true
  end operation

  operation shuffle
    for i : Integer := n - 1 while i > 0 by i := i - 1 do
      var j := Random.randInt(i + 1)
      var tmp := arr.getElement(i)
      arr.putElement(i, arr.getElement(j))
      arr.putElement(j, tmp)
    end for
  end operation

  operation bogosort
    loop while not self.isSorted do self.shuffle end loop
  end operation

  operation run
    self.bogosort
    for i : Integer := 0 while i < n by i := i + 1 do
      stdout.putInt(arr.getElement(i))
    end for
    stdout.putChar('\n')
  end operation

end object
