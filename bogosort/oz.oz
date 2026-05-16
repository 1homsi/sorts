functor
import
   System
   Application
   Random at 'x-oz://system/Random.ozf'
define
   fun {IsSorted Arr}
      N = {Array.high Arr}
      Sorted = {NewCell true}
   in
      for I in 1..N-1 do
         if Arr.I > Arr.(I+1) then Sorted := false end
      end
      @Sorted
   end

   proc {Shuffle Arr}
      N = {Array.high Arr}
   in
      for I in N..2; ~1 do
         J = ({Random.randInt 1 I})
         Tmp = Arr.I
      in
         Arr.I := Arr.J
         Arr.J := Tmp
      end
   end

   proc {Bogosort Arr}
      do
         if {IsSorted Arr} then skip
         else {Shuffle Arr} {Bogosort Arr}
         end
      end
   end

   Arr = {Array.new 1 8 0}
   _ = {Array.put Arr 1 3}
   _ = {Array.put Arr 2 1}
   _ = {Array.put Arr 3 4}
   _ = {Array.put Arr 4 1}
   _ = {Array.put Arr 5 5}
   _ = {Array.put Arr 6 9}
   _ = {Array.put Arr 7 2}
   _ = {Array.put Arr 8 6}
in
   {Bogosort Arr}
   {System.showInfo {Array.toRecord arr Arr}}
   {Application.exit 0}
end
