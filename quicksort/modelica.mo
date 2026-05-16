model Quicksort
  function partition
    input Real arr[:];
    input Integer low;
    input Integer high;
    output Real arrOut[size(arr,1)];
    output Integer p;
  protected
    Real pivot;
    Integer i;
    Real tmp;
  algorithm
    arrOut := arr;
    pivot := arrOut[high];
    i := low;
    for j in low:high-1 loop
      if arrOut[j] <= pivot then
        tmp := arrOut[i]; arrOut[i] := arrOut[j]; arrOut[j] := tmp;
        i := i + 1;
      end if;
    end for;
    tmp := arrOut[i]; arrOut[i] := arrOut[high]; arrOut[high] := tmp;
    p := i;
  end partition;

equation

end Quicksort;
