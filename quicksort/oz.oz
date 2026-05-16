functor
import System Application
define
   fun {QuickSort Lst}
      case Lst
      of nil then nil
      [] Pivot|Rest then
         Left = {Filter Rest fun {$ X} X =< Pivot end}
         Right = {Filter Rest fun {$ X} X > Pivot end}
      in
         {Append {QuickSort Left} Pivot|{QuickSort Right}}
      end
   end

   fun {Filter Lst Pred}
      case Lst
      of nil then nil
      [] H|T then
         if {Pred H} then H|{Filter T Pred}
         else {Filter T Pred}
         end
      end
   end

   Sorted = {QuickSort [3 6 8 10 1 2 1]}
in
   {System.showInfo Sorted}
   {Application.exit 0}
end
