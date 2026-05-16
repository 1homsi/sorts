functor
import System Application
define
   fun {Insert Tree V}
      case Tree
      of nil then node(V nil nil)
      [] node(X L R) then
         if V < X then node(X {Insert L V} R)
         else node(X L {Insert R V}) end
      end
   end

   fun {Inorder Tree}
      case Tree
      of nil then nil
      [] node(V L R) then
         {Append {Inorder L} V|{Inorder R}}
      end
   end

   fun {TreeSort Arr}
      Tree = {List.foldL Arr Insert nil}
   in
      {Inorder Tree}
   end

   Sorted = {TreeSort [5 3 7 1 4 6 8]}
in
   {System.showInfo {Value.toVirtualString Sorted 10 10}}
   {Application.exit 0}
end
