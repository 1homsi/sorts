functor
import System
define
   fun {CountingSort Arr}
      N = {Length Arr}
      Min = {FoldL Arr Value.min {Hd Arr}}
      Max = {FoldL Arr Value.max {Hd Arr}}
      Range = Max - Min + 1
      Count = {MakeTuple count Range}
   in
      for I in 1..Range do Count.I := 0 end
      for V in Arr do Count.(V-Min+1) := Count.(V-Min+1) + 1 end
      for I in 2..Range do Count.I := Count.I + Count.(I-1) end
      Output = {MakeTuple output N}
      for I in N..1;~1 do
         V = {Nth Arr I}
         Idx = V-Min+1
         Count.Idx := Count.Idx - 1
         Output.(Count.Idx+1) := V
      end
      {TupleToList Output}
   end
   {System.showInfo {CountingSort [4 2 2 8 3 3 1]}}
end
