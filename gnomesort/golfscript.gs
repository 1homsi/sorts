{
  .size:n;
  0:i;
  {i n <}{
    i 0 = {i 1+:i;}{
      i 1- @ .[i] @.[i 1-] > {
        .[i] .[i 1-] @ .[i 1-]! .[i]! i 1-:i;
      }{
        i 1+:i;
      }if
    }if
  }while
}:gnome-sort;
