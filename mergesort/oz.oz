functor
import
    System
define
    fun {Merge Left Right}
        case Left#Right
        of nil#_ then Right
        [] _#nil then Left
        [] (Lh|Lt)#(Rh|Rt) then
            if Lh =< Rh then Lh|{Merge Lt Right}
            else Rh|{Merge Left Rt}
            end
        end
    end

    fun {MergeSort Lst}
        N = {Length Lst}
    in
        if N =< 1 then Lst
        else
            Mid = N div 2
            Left = {List.take Lst Mid}
            Right = {List.drop Lst Mid}
        in
            {Merge {MergeSort Left} {MergeSort Right}}
        end
    end

    {System.show {MergeSort [38 27 43 3 9 82 10]}}
end
