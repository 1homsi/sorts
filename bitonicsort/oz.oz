functor
import
   System
   Application
define
   fun {CompareAndSwap Arr I J Dir}
      AI = {Array.get Arr I}
      AJ = {Array.get Arr J}
   in
      if Dir == (AI > AJ) then
         {Array.put Arr I AJ}
         {Array.put Arr J AI}
      end
      Arr
   end

   proc {BitonicMerge Arr Lo Cnt Dir}
      if Cnt > 1 then
         K = Cnt div 2
      in
         for I in Lo..Lo+K-1 do
            _ = {CompareAndSwap Arr I I+K Dir}
         end
         {BitonicMerge Arr Lo K Dir}
         {BitonicMerge Arr Lo+K K Dir}
      end
   end

   proc {BitonicSort Arr Lo Cnt Dir}
      if Cnt > 1 then
         K = Cnt div 2
      in
         {BitonicSort Arr Lo K true}
         {BitonicSort Arr Lo+K K false}
         {BitonicMerge Arr Lo Cnt Dir}
      end
   end

   Arr = {Array.new 0 7 0}
   _ = {Array.put Arr 0 3} _ = {Array.put Arr 1 7} _ = {Array.put Arr 2 4} _ = {Array.put Arr 3 8}
   _ = {Array.put Arr 4 6} _ = {Array.put Arr 5 2} _ = {Array.put Arr 6 1} _ = {Array.put Arr 7 5}
   {BitonicSort Arr 0 8 true}
   for I in 0..7 do
      {System.print {Array.get Arr I}}
      {System.print ' '}
   end
   {System.printInfo "\n"}
   {Application.exit 0}
end
