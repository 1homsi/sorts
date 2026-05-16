functor
export Sort
define
   fun {Insert X Lst}
      case Lst
      of nil then [X]
      [] H|T then
         if X =< H then X|H|T
         else H|{Insert X T}
         end
      end
   end

   fun {Sort Lst}
      case Lst
      of nil then nil
      [] H|T then {Insert H {Sort T}}
      end
   end
end
