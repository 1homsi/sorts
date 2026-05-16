functor
import System

define
   MinRun = 32

   fun {InsertVal X Lst}
      case Lst of nil then [X]
      [] H|T then
         if X =< H then X|H|T
         else H|{InsertVal X T} end
      end
   end

   fun {InsertionSort Lst}
      case Lst of nil then nil
      [] H|T then {InsertVal H {InsertionSort T}}
      end
   end

   fun {MergeRuns Xs Ys}
      case Xs of nil then Ys
      [] _ then
         case Ys of nil then Xs
         [] _ then
            if Xs.1 =< Ys.1 then
               Xs.1 | {MergeRuns Xs.2 Ys}
            else
               Ys.1 | {MergeRuns Xs Ys.2}
            end
         end
      end
   end

   fun {ChunksOf N Lst}
      if Lst == nil then nil
      else
         fun {Take L K}
            if K == 0 orelse L == nil then nil
            else L.1 | {Take L.2 K-1} end
         end
         fun {Drop L K}
            if K == 0 orelse L == nil then L
            else {Drop L.2 K-1} end
         end
         {Take Lst N} | {ChunksOf N {Drop Lst N}}
      end
   end

   fun {MergePairs Runs}
      case Runs of nil then nil
      [] [X] then [X]
      [] X|Y|Rest then {MergeRuns X Y} | {MergePairs Rest}
      end
   end

   fun {MergeAll Runs}
      case Runs of [X] then X
      [] _ then {MergeAll {MergePairs Runs}}
      end
   end

   fun {Timsort Lst}
      if Lst == nil then nil
      else
         Chunks = {ChunksOf MinRun Lst}
         Sorted = {Map Chunks InsertionSort}
      in
         {MergeAll Sorted}
      end
   end

   Result = {Timsort [5 2 8 1 9 3 7 4 6]}
in
   {System.showInfo Result}
end
