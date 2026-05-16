functor
import System Application
define
   fun {GetDigit X Exp}
      (X div Exp) mod 10
   end

   fun {CountingSort Xs Exp}
      Buckets = {Map {List.number 0 9 1} fun {$ D}
         {Filter Xs fun {$ X} {GetDigit X Exp} == D end}
      end}
   in
      {Flatten Buckets}
   end

   fun {RadixSort Xs}
      case Xs of nil then nil
      else
         MaxVal = {FoldL Xs Max 0}
         fun {Loop Arr Exp}
            if MaxVal div Exp == 0 then Arr
            else {Loop {CountingSort Arr Exp} Exp*10}
            end
         end
      in
         {Loop Xs 1}
      end
   end

   Result = {RadixSort [170 45 75 90 802 24 2 66]}
in
   {System.showInfo {Value.toVirtualString Result 100 100}}
   {Application.exit 0}
end
