functor
export
   GnomeSort
define
   proc {GnomeSort Arr}
      N = {Array.high Arr} - {Array.low Arr} + 1
      Low = {Array.low Arr}
      I = {NewCell Low}
   in
      for while: @I =< Low + N - 1 do
         if @I == Low orelse Arr.(@I) >= Arr.(@I - 1) then
            I := @I + 1
         else
            Tmp = Arr.(@I)
         in
            Arr.(@I) := Arr.(@I - 1)
            Arr.(@I - 1) := Tmp
            I := @I - 1
         end
      end
   end
end
