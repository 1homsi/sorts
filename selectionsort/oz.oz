functor
import Application
define
   fun {SelectionSort Lst}
      case Lst of nil then nil
      [] _|_ then
         Min = {List.min Lst}
         Rest = {List.subtract Lst Min}
      in
         Min|{SelectionSort Rest}
      end
   end
end
