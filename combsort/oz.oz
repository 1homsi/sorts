functor
import System

define
   proc {CombSort Arr N}
      Gap = {NewCell N}
      Sorted = {NewCell false}
   in
      for while: @Sorted == false do
         Gap := {Max 1 {Float.toInt {Float.floor @Gap / 1.3}}}
         if @Gap =< 1 then Gap := 1 Sorted := true end
         for I in 0..N-@Gap-1 do
            if Arr.I > Arr.(I+@Gap) then
               Tmp = Arr.I
               Arr.I := Arr.(I+@Gap)
               Arr.(I+@Gap) := Tmp
               Sorted := false
            end
         end
      end
   end
end
