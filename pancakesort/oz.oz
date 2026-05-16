functor
import
   System
define
   fun {Flip Arr K}
      Left = {NewCell 0}
      Right = {NewCell K}
      A = {Array.make 0 {Array.high Arr} 0}
   in
      {For 0 {Array.high Arr} 1 proc {$ I} A.I := Arr.I end}
      for while: @Left < @Right do
         Tmp = A.(@Left)
      in
         A.(@Left) := A.(@Right)
         A.(@Right) := Tmp
         Left := @Left + 1
         Right := @Right - 1
      end
      A
   end

   fun {FindMaxIdx Arr Size}
      MaxIdx = {NewCell 0}
   in
      {For 1 Size-1 1 proc {$ I}
         if Arr.I > Arr.(@MaxIdx) then MaxIdx := I end
      end}
      @MaxIdx
   end

   proc {PancakeSort Arr}
      Size = {NewCell {Array.high Arr} + 1}
   in
      for while: @Size > 1 do
         MaxIdx = {FindMaxIdx Arr @Size}
      in
         if MaxIdx \= @Size - 1 then
            if MaxIdx \= 0 then
               {Array.copy {Flip Arr MaxIdx} Arr}
            end
            {Array.copy {Flip Arr @Size - 1} Arr}
         end
         Size := @Size - 1
      end
   end

   Arr = {Array.make 0 6 0}
in
   Arr.0 := 3  Arr.1 := 6  Arr.2 := 2  Arr.3 := 7
   Arr.4 := 4  Arr.5 := 1  Arr.6 := 5
   {PancakeSort Arr}
   {System.show Arr}
end
