functor
export Sort
define
   proc {SwapIfNeeded Arr I Swapped}
      A = Arr.I
      B = Arr.(I+1)
   in
      if A > B then
         Arr.I := B
         Arr.(I+1) := A
         Swapped := true
      end
   end

   proc {ForwardPass Arr Start End Swapped}
      for I in Start..End-1 do
         {SwapIfNeeded Arr I Swapped}
      end
   end

   proc {BackwardPass Arr Start End Swapped}
      for I in End-1..Start;~1 do
         {SwapIfNeeded Arr I Swapped}
      end
   end

   fun {Sort List}
      N = {Length List}
      Arr = {Array.fromList List}
      Swapped = {NewCell true}
      Start = {NewCell 1}
      End = {NewCell N}
   in
      for while: @Swapped do
         Swapped := false
         {ForwardPass Arr @Start @End Swapped}
         if @Swapped then
            Swapped := false
            End := @End - 1
            {BackwardPass Arr @Start @End Swapped}
            Start := @Start + 1
         end
      end
      {Array.toList Arr}
   end
end
