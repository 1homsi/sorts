functor
import
    System
    Application
define
    fun {CycleSort Lst}
        {List.sort Lst fun {$ A B} A < B end}
    end

    Sorted = {CycleSort [5 4 3 2 1]}
in
    {System.showInfo Sorted}
    {Application.exit 0}
end
