functor
import System Application

define
   proc {ShellSort Arr N}
      Gap = {NewCell N div 2}
   in
      for while: @Gap > 0 do
         for I in @Gap..N-1 do
            Temp = Arr.I
            J = {NewCell I}
         in
            for while: @J >= @Gap andthen Arr.(@J - @Gap) > Temp do
               Arr.@J := Arr.(@J - @Gap)
               J := @J - @Gap
            end
            Arr.@J := Temp
         end
         Gap := @Gap div 2
      end
   end

   N = 7
   Arr = {Array.new 0 N-1 0}
   _ = {List.foldLInd [64 34 25 12 22 11 90]
        fun {$ I _ X} Arr.(I-1) := X I end 1}
   {ShellSort Arr N}
   {For 0 N-1 1 proc {$ I} {System.print Arr.I} {System.print ' '} end}
   {Application.exit 0}
end
