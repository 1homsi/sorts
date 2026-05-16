functor
import
   System
define
   proc {Heapify Arr N I}
      Largest = {NewCell I}
      Left = 2*I + 1
      Right = 2*I + 2
   in
      if Left < N andthen Arr.Left > Arr.@Largest then Largest := Left end
      if Right < N andthen Arr.Right > Arr.@Largest then Largest := Right end
      if @Largest \= I then
         Tmp = Arr.I
      in
         Arr.I := Arr.@Largest
         Arr.@Largest := Tmp
         {Heapify Arr N @Largest}
      end
   end

   proc {HeapSort Arr N}
      I = {NewCell N div 2 - 1}
   in
      for while:@I >= 0 do
         {Heapify Arr N @I}
         I := @I - 1
      end
      I := N - 1
      for while:@I > 0 do
         Tmp = Arr.0
      in
         Arr.0 := Arr.@I
         Arr.@I := Tmp
         {Heapify Arr @I 0}
         I := @I - 1
      end
   end

   Arr = {Array.new 0 5 0}
   _ = {Array.put Arr 0 12} _ = {Array.put Arr 1 11} _ = {Array.put Arr 2 13}
   _ = {Array.put Arr 3 5} _ = {Array.put Arr 4 6} _ = {Array.put Arr 5 7}
   {HeapSort Arr 6}
   {System.show {Array.toRecord unit Arr}}
end
