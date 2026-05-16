functor
import
   System
   Application
define
   fun {InsertSorted X Lst}
      case Lst
      of nil then [X]
      [] H|T then
         if X =< H then X|H|T
         else H|{InsertSorted X T}
         end
      end
   end

   fun {InsertionSort Lst}
      case Lst
      of nil then nil
      [] H|T then {InsertSorted H {InsertionSort T}}
      end
   end

   fun {GetIdx Num Min Max N}
      Raw = {Float.toInt (Num - Min) / (Max - Min + 1.0) * {Int.toFloat N}}
      in
      {Min N-1 Raw}
   end

   fun {BucketSort Arr}
      N = {Length Arr}
      Min = {FoldL Arr Float.min {Hd Arr}}
      Max = {FoldL Arr Float.max {Hd Arr}}
      Buckets = {MakeTuple buckets N}
      _ = {For 1 N 1 proc {$ I} Buckets.I = nil end}
   in
      {ForAll Arr proc {$ Num}
         Idx = {GetIdx Num Min Max N} + 1
         SafeIdx = if Idx > N then N else Idx end
      in
         Buckets.SafeIdx = Num|Buckets.SafeIdx
      end}
      {FoldL {Record.toList Buckets} fun {$ Acc B}
         {Append Acc {InsertionSort B}}
      end nil}
   end

   Data = [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]
   Sorted = {BucketSort Data}
in
   {System.showInfo Sorted}
   {Application.exit 0}
end
