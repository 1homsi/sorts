functor
import System
define
   proc {BubblePass Arr N ?NewArr ?Swapped}
      Swapped = {NewCell false}
      NewArr = {Array.clone Arr}
      for I in 1..N-1 do
         if {Array.get NewArr I} > {Array.get NewArr I+1} then
            Tmp = {Array.get NewArr I}
         in
            {Array.put NewArr I {Array.get NewArr I+1}}
            {Array.put NewArr I+1 Tmp}
            Swapped := true
         end
      end
   end

   proc {BubbleSort Arr N}
      NewArr Swapped
   in
      {BubblePass Arr N NewArr Swapped}
      if @Swapped then
         {BubbleSort NewArr N-1}
      end
   end

   Arr = {Array.new 1 7 0}
   Vals = [64 34 25 12 22 11 90]
   _ = {List.foldLInd Vals fun {$ I _ V} {Array.put Arr I V} I end 1}
   {BubbleSort Arr 7}
   {System.showInfo {Array.toRecord unit Arr}}
end
